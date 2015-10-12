//
//  BCConfigurationDefines.h
//  BCar
//
//  Created by WillDeng on 15/9/1.
//  Copyright (c) 2015年 eggeggs. All rights reserved.
//  本程序参数配置

#ifndef BCar_BCConfigurationDefines_h
#define BCar_BCConfigurationDefines_h

//当前程序版本
#define BCCFBundleShortVersionString [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//腾讯地图SDK KEY
#define QMAP_SERVICES_API_KEY @"NPNBZ-GRT3V-EYVPT-UD7WG-GDH4S-GLFAG"

//网络请求地址
#ifdef DEBUG
#define BC_HOST_URL     @"http://api.lf.dan.shen.li"
#else
#define BC_HOST_URL     @"http://api.lf.dan.shen.li"
#endif

//测试接口
#define BC_API_TEST             @"/sys/api.json"


#pragma mark - 用户中心、登陆、注册
/**
 *  获取注册码 参数：mobile，type {1司机、2乘客}，code_type {reg 注册, login 登录, findpass 找回密码, editpass 修改密码, pay 支付, drawing 提现
 */
#define BC_API_USER_SEND_VCODE @"/user/send_vcode.json"

/**
 *  在用户进行注册、登陆或找回密码等需要填写资料时。参数：val 要检测的值，type {1司机、2乘客}，val_type 检测值的类型{mobile, nickname, email}
 */
#define BC_API_USER_CHECK @"/user/check.json"

/**
 *  注册 参数：mobile，type {1司机、2乘客}，vcode 验证码，password 登录密码，recommend 推荐者手机号
 */
#define BC_API_USER_REG @"/user/reg.json"

/**
 *  登录 参数：mobile，type {1司机、2乘客}，password 登录密码，login_type{默认登录、1验证码登录}
 */
#define BC_API_USER_LOGIN @"/user/login.json"

/**
 *  注册 参数：mobile，type {1司机、2乘客}
 */
#define BC_API_USER_FIND_PASSWORD @"/user/find_password.json"

/**
 *  用户设备 参数：method，type {get 获取列表、set 更新或新增设备}
 */
#define BC_API_USER_DEVICE             @"/user/device.json"

/**
 *  个人资料 参数：type {get 获取、set 更新}
 */
#define BC_API_USER_PROFILE @"/user/profile.json"

/**
 *  数据列表 参数：type{integral 积分，money 余额，coupon优惠卷}，page{1-max 当前页码，默认值1}，pagesize{1-50}每页显示数量
 */
#define BC_API_USER_DATALIST @"/user/datalist.json"

/**
 *  修改密码
 */
#define BC_API_EDIT_PASSWORD @"/user/edit_password.json"

/**
 *  修改头像
 */
#define BC_API_EDIT_AVATER @"/user/edit_avater.json"

#endif
