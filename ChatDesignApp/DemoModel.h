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
static NSString * kJSQDemoAvatarDisplayNameSquires = @"Spinu Marcel";
static NSString * kJSQDemoAvatarDisplayNameCook = @"Random";
//static NSString * const kJSQDemoAvatarDisplayNameJobs = @"Jobs";
//static NSString * const kJSQDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString *  kJSQDemoAvatarIdSquires = @"24";
static NSString *  kJSQDemoAvatarIdCook = @"26";
//static NSString * const kJSQDemoAvatarIdJobs = @"19";
//static NSString * const kJSQDemoAvatarIdWoz = @"4";

@interface DemoModel : NSObject

@property (strong,nonatomic) NSString *name;



@property (strong, nonatomic) NSMutableArray *messages;


@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) JSQMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) JSQMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;


- (void)addPhotoMediaMessage:(UIImage *)image;

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion;

- (void)addVideoMediaMessage;

- (void)addVideoMediaMessageWithThumbnail;

- (void)addAudioMediaMessage;

@end
