//
//  LoginViewController.m
//  ChatDesignApp
//
//  Created by Vadim on 4/11/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "LoginViewController.h"
#import "RequestManager.h"
#import "DemoMessageViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)LoginAction:(id)sender {
    
    [[RequestManager sharedManager]loginWithEmail:nil username:self.userName.text password:self.passWord.text onSucces:^(NSString *response)
    {

        
    }onFail:^(NSError *error ,NSInteger statusCode)
    {
        
        NSLog(@"Error is %@ , and Status is %ld",[error localizedDescription],(long)statusCode);
    }];

}
@end
