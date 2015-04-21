//
//  ViewController.m
//  RongCloudDemo
//
//  Created by 杜立召 on 15/4/18.
//  Copyright (c) 2015年 dlz. All rights reserved.
//

#import "ViewController.h"
#import "ChatListViewController.h"
#import <RongIMKit/RCConversationViewController.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect viewSize=self.view.bounds;
    UIButton*loginButton=[[UIButton alloc]initWithFrame:CGRectMake(viewSize.size.width/2-50, viewSize.size.height/2, 100, 50)];
    
    [loginButton setTitle:@"登录融云" forState:UIControlStateNormal];
    loginButton.backgroundColor=[UIColor blueColor];
    [loginButton addTarget:self action:@selector(loginRongCloud) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    

}

/**
 *登录融云
 *
 */
-(void)loginRongCloud
{
    //登录融云服务器,开始阶段可以先从融云API调试网站获取，之后token需要通过服务器到融云服务器取。
    NSString*token=@"JFxGTunyLd41P2gbifk2o6ZMo/KVDHrEYcpc/b7q1zvRMx4J8NRKVdf3O3BAumPYR53P3Jh0fwo+cSWhr8lNwQ==";
    [[RCIM sharedKit] connectWithToken:token success:^(NSString *userId) {
    {
            //设置用户信息提供者,页面展现的用户头像及昵称都会从此代理取
            [[RCIM sharedKit] setUserInfoFetcherDelegate:self];
            NSLog(@"Login successfully with userId: %@.", userId);
            dispatch_async(dispatch_get_main_queue(), ^{
                ChatListViewController *chatListViewController = [[ChatListViewController alloc]init];
                [self.navigationController pushViewController:chatListViewController animated:YES];
            });
            
        }
    } error:^(RCConnectErrorCode status) {
        {
            NSLog(@"登录失败%d",(int)status);
        }
    }];

}
/**
 *此方法中要提供给融云用户的信息，建议缓存到本地，然后改方法每次从您的缓存返回
 */
- (void)getUserInfoWithUserId:(NSString *)userId completion:(void(^)(RCUserInfo* userInfo))completion
{
    //此处为了演示写了一个用户信息
    if ([@"2440" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"1";
        user.name = @"百度";
        user.portraitUri = @"https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=1756054607,4047938258&fm=96&s=94D712D20AA1875519EB37BE0300C008";
        
        return completion(user);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
