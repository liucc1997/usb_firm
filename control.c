#include "defs.h"
#include "usb.h"
#include "timers.h"

static const BYTE deviceDescriptor[] = { 0x12,/*描述符长度*/ 0x01,/*描述符类型*/ 0x00, 0x02,/*USB版本号*/ 0x00, 0x00, 0x00, 0x40/*端点0支持最大数据包长度*/,
                                         0xB4, 0x04/*供应商ID*/, 0x05, 0x11,/*产品ID*/ 0x00, 0x00,/*设备版本号*/ 0x00, 0x00, 0x00, 0x01/*配置数*/ };
static const BYTE configDescriptor[] = { 0x09, 0x02, sizeof(configDescriptor) & 0xFF, sizeof(configDescriptor) >> 8, 0x02, 0x01, 0x00, 0x80, 0x4B,
                                         0x09, 0x04, 0x00, 0x00, 0x03, 0x08, 0x06, 0x50, 0x00,//接口描述符
										 //长度 固   方向端点号/传输方式
										 0x07, 0x05, 0x81, 0x02, 0x40, 0x00, 0x00,//端点
										 0x07, 0x05, 0x02, 0x02, 0x40, 0x00, 0x00,
										 0x07, 0x05, 0x83, 0x03, 0x08, 0x00, 0x00,
										 0x09, 0x04, 0x01, 0x00, 0x02, 0x03, 0x02, 0x01, 0x00,//接口描述符
										 0x09/*长度*/, 0x21, 0x01, 0x01/*规范版本*/, 0x00/*国家*/, 0x01/*附属类个数*/, 0x22/*附属类类型*/,//Hid描述符
										 sizeof(HIDreportDescriptorMouse) & 0xFF,
										 sizeof(HIDreportDescriptorMouse) >> 8,/*附属类长度*/
										 0x07, 0x05, 0x83, 0x03, 0x08, 0x00, 0x01,
										 //This is a dummy endpoint to make the descriptor != 0x40, because the controller is stupid.
										 0x07, 0x05, 0x04, 0x03, 0x08, 0x00, 0x01 };
static const BYTE HIDreportDescriptor[] = { 0x05, 0x01, 0x09, 0x06, 0xA1, 0x01, 0x05, 0x07,
											0x19, 0xE0, 0x29, 0xE7, 0x15, 0x00, 0x25, 0x01, 0x75, 0x01,
											0x95, 0x08, 0x81, 0x02, 0x95, 0x01, 0x75, 0x08, 0x81, 0x01,
											0x95, 0x05, 0x75, 0x01, 0x05, 0x08, 0x19, 0x01, 0x29, 0x05,
											0x91, 0x02,	0x95, 0x01, 0x75, 0x03, 0x91, 0x01, 0x95, 0x06,
											0x75, 0x08, 0x15, 0x00, 0x25, 0x65, 0x05, 0x07, 0x19, 0x00,
											0x29, 0x65, 0x81, 0x00, 0xC0 };
static const BYTE HIDreportDescriptorMouse[] =	{ 
											0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
											//鼠标   
											0x09, 0x02,                    // USAGE (Mouse)  
											//集合   
											0xa1, 0x01,                    // COLLECTION (Application) 
											//指针设备   
											0x09, 0x01,                    //   USAGE (Pointer) 
											//集合   
											0xa1, 0x00,                    //   COLLECTION (Physical)
											//按键   
											0x05, 0x09,                    //     USAGE_PAGE (Button) 
											//使用最小值1   
											0x19, 0x01,                    //     USAGE_MINIMUM (Button 1)
											//使用最大值3。1表示左键，2表示右键，3表示中键   
											0x29, 0x03,                    //     USAGE_MAXIMUM (Button 3)
											//逻辑最小值0   
											0x15, 0x00,                    //     LOGICAL_MINIMUM (0)
											//逻辑最大值1   
											0x25, 0x01,                    //     LOGICAL_MAXIMUM (1)
											//数量为3   
											0x95, 0x03,                    //     REPORT_COUNT (3)
											//大小为1bit   
											0x75, 0x01,                    //     REPORT_SIZE (1)
											//输入，变量，数值，绝对值   
											//以上3个bit分别表示鼠标的三个按键情况，最低位（bit-0）为左键
											//bit-1为右键，bit-2为中键，按下时对应的位值为1，释放时对应的值为0
											0x81, 0x02,                    //     INPUT (Data,Var,Abs)
											//填充5个bit，补足一个字节   
											0x95, 0x01,                    //     REPORT_COUNT (1)
											0x75, 0x05,                    //     REPORT_SIZE (5) 
											0x81, 0x03,                    //     INPUT (Cnst,Var,Abs)
											//用途页为通用桌面   
											0x05, 0x01,                    //     USAGE_PAGE (Generic Desktop)
											//用途为X   
											0x09, 0x30,                    //     USAGE (X)
											//用途为Y   
											0x09, 0x31,                    //     USAGE (Y)
											//用途为滚轮   
											0x09, 0x38,                    //     USAGE (Wheel)
											//逻辑最小值为-127   
											0x15, 0x81,                    //     LOGICAL_MINIMUM (-127)
											//逻辑最大值为+127   
											0x25, 0x7f,                    //     LOGICAL_MAXIMUM (127)
											//大小为8个bits   
											0x75, 0x08,                    //     REPORT_SIZE (8)
											//数量为3个，即分别代表x,y,滚轮   
											0x95, 0x03,                    //     REPORT_COUNT (3)
											//输入，变量，值，相对值   
											0x81, 0x06,                    //     INPUT (Data,Var,Rel)
											//关集合   
											0xc0,                          //   END_COLLECTION
											0xc0                           // END_COLLECTION
										};										
static const BYTE deviceQualifierDescriptor[] = { 0x0A, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00 };

void EP0ACK()
{
	EP0CS = bmEP0ACK;
}

static BYTE SetAddress()
{
	BYTE ret = FALSE;

	if (wValue < 0x7F)
	{
		EP0ACK();
		ret = TRUE;
	}

	return ret;
}

static BYTE GetDescriptor()
{
	BYTE type = (wValue >> 8) & 0xFF;
	BYTE i, total;
	BYTE ret = FALSE;

	switch (type)
	{
		case 0x01:
		{
			for (i = 0; i < 0x12; i++)
			{
				EP0.fifo = deviceDescriptor[i];
			}

			SendControlResponse(wLength < 0x12 ? wLength : 0x12);
			ret = TRUE;

			break;
		}
		case 0x02:
		{
			total = wLength < sizeof(configDescriptor) ? wLength : sizeof(configDescriptor);
			for (i = 0; i < total; i++)
			{
				EP0.fifo = configDescriptor[i];
			}

			SendControlResponse(total);
			ret = TRUE;

			break;
		}
		case 0x06:
		{
			for (i = 0; i < sizeof(deviceQualifierDescriptor); i++)
			{
				EP0.fifo = deviceQualifierDescriptor[i];
			}
			
			SendControlResponse(wLength < sizeof(deviceQualifierDescriptor) ? wLength : sizeof(deviceQualifierDescriptor));
			ret = TRUE;
			
			break;
		}
		case 0x22:
		{
			for (i = 0; i < sizeof(HIDreportDescriptor); i++)
			{
				EP0.fifo = HIDreportDescriptor[i];
			}
			
			SendControlResponse(wLength < sizeof(HIDreportDescriptor) ? wLength : sizeof(HIDreportDescriptor));
			ret = TRUE;
		
			break;
		}
		default:
		{
			break;
		}
	}

	return ret;
}

static BYTE SetConfiguration()
{
	BYTE ret = FALSE;

	//if (wValue <= 1)
	if(1)//liucc
	{
		EP0ACK();
		ret = TRUE;
	}

	return ret;
}

BYTE HandleStandardRequest()
{
	switch(bRequest)
	{
		case 0x05:
		{
			return SetAddress();
		}
		case 0x06:
		{
			return GetDescriptor();
		}
		case 0x09:
		{
			return SetConfiguration();
		}
		default:
		{
			return FALSE;
		}
	}
}

static BYTE GetMaxLUN()
{
	EP0.fifo = 0x00;
	SendControlResponse(wLength < 0x01 ? wLength : 0x01);

	return TRUE;
}

BYTE HandleClassRequest()
{
	switch(bRequest)
	{
		case 0x09:
		{
			EP0CS = 0x05;
			return TRUE;
		}
		case 0x0A:
		{
			EP0ACK();
			return TRUE;
		}
		case 0xFE:
		{
			return GetMaxLUN();
		}
		default:
		{
			return FALSE;
		}
	}
}

BYTE HandleVendorRequest()
{
	return FALSE;
}
