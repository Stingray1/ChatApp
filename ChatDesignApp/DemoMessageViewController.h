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
#import <Firebase/Firebase.h>
@import Firebase;
@import FirebaseDatabase;
@import FirebaseCore;
@import FirebaseInstanceID;


@class DemoMessagesViewController;
@protocol JSQDemoViewControllerDelegate <NSObject>

- (void)didDismissJSQDemoViewController:(DemoMessagesViewController *)vc;

@end

@interface DemoMessageViewController : JSQMessagesViewController <UIActionSheetDelegate , JSQMessagesComposerTextViewPasteDelegate >




@property (weak, nonatomic) id<JSQDemoViewControllerDelegate> delegateModal;

@property (strong, nonatomic) DemoModel *demoData;




@end
