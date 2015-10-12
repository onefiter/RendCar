//
//  ZDCommonDefines.h
//  ZDBaseCode
//
//  Created by 杨志达 on 15/8/21.
//  Copyright (c) 2015年 杨志达. All rights reserved.
//

#ifndef ZDBaseCode_ZDCommonDefines_h
#define ZDBaseCode_ZDCommonDefines_h

#ifdef DEBUG
#define ZDLog(fmt, ...) {NSLog((@"%s [LINE %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);}
#else
#define ZDLog(fmt, ...) nil
#endif

#define FIT_320_SCREEN(h) h / 320.0f * [[UIScreen mainScreen] bounds].size.width


#endif
