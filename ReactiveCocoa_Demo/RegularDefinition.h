//
//  RegularDefinition.h
//  RotateTest
//  vesion:1.0
//  Created by Motinle on 13-8-18.
//  Copyright (c) 2013年 广州传讯信息科技有限公司. All rights reserved.
//

#ifndef RegularDefinition_h
#define RegularDefinition_h


#define R_Null [NSNull null]

#define CurrentBoundsSize [UIScreen mainScreen].bounds.size
#define CurrentWidth CurrentBoundsSize.width
#define CurrentHeight CurrentBoundsSize.height

//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define R_UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define R_UIColorFromRGBWithAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]


//带有RGBA的颜色设置
#define R_COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define R_RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define R_RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define R_BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

//清除背景色
#define R_CLEARCOLOR [UIColor clearColor]

#pragma mark - color functions
#define R_RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define R_RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

//----------------------颜色类--------------------------




//----------------------图片----------------------------

//读取本地图片
#define R_LOADIMAGE(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:type]]

//定义UIImage对象
#define R_IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:@"png"]]

//定义UIImage对象
#define R_ImageNamed(_pointer) [UIImage imageNamed:_pointer]

//建议使用前两种宏定义,性能高于后者
//----------------------图片----------------------------




//----------------------其他----------------------------

//方正黑体简体字体定义
#define R_FONT(F) [UIFont fontWithName:@"STHeiti Light" size:F]

//粗体
#define FontBoldMS(sizeH) [UIFont fontWithName:@"TrebuchetMS-Bold" size:sizeH];
#define FontBoldHT(sizeH) [UIFont fontWithName:@"Helvetica-Bold" size:sizeH];

#define FontBoldMY(sizeH) [UIFont fontWithName:@"MicrosoftYaHei" size:sizeH]

//显示Alert
#define R_ALERT_MSG(title,msg)\
{\
UIAlertView *_alert=[[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil]; \
[_alert show]; \
}

//定义一个API
#define R_APIURL                @"http://10.10.6.9/"
//登陆API
#define R_APIHTTP(url)              ([APIURL stringByAppendingString:url])
#define APIURL @"http://113.108.222.107:80/TexmanAppServer/ifm/newsList.spr"
#define APICURREVENTS @"http://113.108.222.107:80/TexmanAppServer/ad/currevents.spr"
#define APILOGIN @"http://113.108.222.107:80/TexmanAppServer/user/login.spr"
//设置View的tag属性
#define R_VIEWWITHTAG(_OBJECT, _TAG)    [_OBJECT viewWithTag : _TAG]
//程序的本地化,引用国际化的文件
#define MyLocal(x, ...) NSLocalizedString(x, nil)

//由角度获取弧度 由弧度获取角度
#define R_degreesToRadian(x) (M_PI * (x) / 180.0)
#define R_radianToDegrees(radian) (radian*180.0)/(M_PI)
//----------------------其他----------------------------


#endif
