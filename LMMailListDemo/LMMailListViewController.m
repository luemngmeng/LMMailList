//
//  LMMailListViewController.m
//  LMMailListDemo
//
//  Created by mengmenglu on 3/2/16.
//  Copyright © 2016 Hangzhou TaiXuan Network Technology Co., Ltd. All rights reserved.
//

#import "LMMailListViewController.h"
#import "ContactsManager.h"

@interface LMMailListViewController ()

@end

@implementation LMMailListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通讯录";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取手机本地通讯录
    UIButton *getDataFromPhone = [UIButton buttonWithType:UIButtonTypeSystem];
    getDataFromPhone.frame = CGRectMake(50, 100, 200, 40);
    getDataFromPhone.layer.borderColor = [[UIColor grayColor] CGColor];
    getDataFromPhone.layer.borderWidth = 0.5f;
    getDataFromPhone.layer.cornerRadius = 4.0f;
    getDataFromPhone.layer.masksToBounds = YES;
    [getDataFromPhone setTitle:@"获取手机本地通讯录" forState:UIControlStateNormal];
    [getDataFromPhone setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [getDataFromPhone addTarget:self action:@selector(getDataFromPhoneClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:getDataFromPhone];

}

- (void)getDataFromPhoneClick:(id)button{
    NSLog(@"获取本地通讯录");
    __weak __typeof(self) weakself = self;
    [[ContactsManager sharedInstace] checkAddressBookAuthorization:^(NSInteger authorizationStatus) {
        
        if (authorizationStatus == 3) {// 已授权
            dispatch_async(dispatch_get_main_queue(), ^{
                [[ContactsManager sharedInstace] openContactsFromViewController:weakself successBlock:^(ContactsInfo *info) {
                    NSLog(@"name is %@,phone is %@",info.contactName,info.contactPhoneNumber);
                }];
            });
        }else {// 授权失败
            NSString *msg = @"口袋钱包无法访问您的通讯录。请在系统设置 - 隐私 - 通讯录里允许口袋钱包访问您的通讯录";
            dispatch_async(dispatch_get_main_queue(), ^{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                [alert show];
            });
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
