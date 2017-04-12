//
//  LoginViewController.h
//  ChatDesignApp
//
//  Created by Vadim on 4/11/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *userName;


- (IBAction)LoginAction:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *passWord;
@end
