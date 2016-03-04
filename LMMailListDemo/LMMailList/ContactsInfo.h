//
//  ContactsInfo.h
//  LMMailListDemo
//
//  Created by mengmenglu on 3/2/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//  通讯录联系人信息Model

#import <Foundation/Foundation.h>

@interface ContactsInfo : NSObject

/**
 *  联系人姓名
 */
@property (nonatomic, copy) NSString *contactName;

/**
 *  联系人电话
 */
@property (nonatomic, copy) NSString *contactPhoneNumber;

@end
