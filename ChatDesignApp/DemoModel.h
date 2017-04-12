//
//  DemoModel.h
//  ChatDesignApp
//
//  Created by Vadim on 4/10/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSQMessages.h"
#import <JSQMessagesAvatarImageFactory.h>
#import <JSQMessagesAvatarImage.h>
#import <JSQMessageAvatarImageDataSource.h>

static NSString * const kJSQDemoAvatarDisplayNameSquires = @"Jesse Squires";
static NSString * const kJSQDemoAvatarDisplayNameCook = @"Marcel Spinu";
static NSString * const kJSQDemoAvatarDisplayNameJobs = @"Jobs";
static NSString * const kJSQDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString * const kJSQDemoAvatarIdSquires = @"1";
static NSString * const kJSQDemoAvatarIdCook = @"2";
static NSString * const kJSQDemoAvatarIdJobs = @"19";
static NSString * const kJSQDemoAvatarIdWoz = @"4";

@interface DemoModel : NSObject

@property (strong, nonatomic) NSMutableArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

@end
