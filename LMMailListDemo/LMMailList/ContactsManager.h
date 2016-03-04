//
//  ContactsManager.h
//  LMMailListDemo
//
//  Created by mengmenglu on 3/2/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
/*  区分iOS系统
 *
 *  选择联系人
 *  iOS9新增Contacts.framework
 *  ContactsManager结合Contacts.framework与AddressBook.framework
 *  通讯录申请授权在此类中处理
 */

#import <Foundation/Foundation.h>
#import "ContactsInfo.h"


typedef void(^SelectedContactsBlock)(ContactsInfo *info);
#if IOS_9
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>

@interface ContactsManager : NSObject<ABPeoplePickerNavigationControllerDelegate, CNContactPickerDelegate, CNContactViewControllerDelegate>{
    CNContactPickerViewController *_contactsPicker;
}

#else
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ContactsManager : NSObject<ABPeoplePickerNavigationControllerDelegate>{
    ABPeoplePickerNavigationController *_abPicker;
}


#endif

@property (nonatomic, copy) SelectedContactsBlock block;

+ (instancetype)sharedInstace;

- (void)openContactsFromViewController:(UIViewController *)viewController successBlock:(void (^) (ContactsInfo *info))block;

- (void)checkAddressBookAuthorization:(void (^) (NSInteger authorizationStatus))block;

@end
