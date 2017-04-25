//
//  DemoMessageViewController.h
//  ChatDesignApp
//
//  Created by Vadim on 4/10/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "ViewController.h"
#import <JSQMessagesViewController.h>
#import "DemoModel.h"



@class DemoMessagesViewController;
@protocol JSQDemoViewControllerDelegate <NSObject>

- (void)didDismissJSQDemoViewController:(DemoMessagesViewController *)vc;

@end

@interface DemoMessageViewController : JSQMessagesViewController <UIActionSheetDelegate , JSQMessagesComposerTextViewPasteDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate >




@property (weak, nonatomic) id<JSQDemoViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DemoModel *demoData;
@property (copy, nonatomic) NSString *placeHolder;
@property (strong, nonatomic) UILabel *placeHolderLabel;
@property (strong,nonatomic) NSString *name;
@property (strong,nonatomic) NSString *userID;


@end
