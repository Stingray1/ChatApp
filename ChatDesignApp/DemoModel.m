//
//  DemoModel.m
//  ChatDesignApp
//
//  Created by Vadim on 4/10/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "DemoModel.h"

@implementation DemoModel


- (instancetype)init
{
    self = [super init];
    if (self) {
      [self allocMessageArray];
    
        JSQMessagesAvatarImage *jsqImage = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"JSQ" backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f] textColor:[UIColor colorWithWhite:0.60f alpha:1.0f] font:[UIFont systemFontOfSize:14.0f] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];

        JSQMessagesAvatarImage *cookImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_cook"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
       JSQMessagesAvatarImage *jobsImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_jobs"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
         JSQMessagesAvatarImage *wozImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_woz"] diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
//          self.avatars = @{ kJSQDemoAvatarIdSquires : jsqImage,
//                          kJSQDemoAvatarIdCook : cookImage,
//                          kJSQDemoAvatarIdJobs : jobsImage,
//                          kJSQDemoAvatarIdCook : wozImage };
////
//        self.users = @{ kJSQDemoAvatarIdJobs : kJSQDemoAvatarDisplayNameJobs,
//                        kJSQDemoAvatarIdCook : kJSQDemoAvatarDisplayNameCook,
//                        kJSQDemoAvatarIdWoz : kJSQDemoAvatarDisplayNameWoz,
//                        kJSQDemoAvatarIdSquires : kJSQDemoAvatarDisplayNameSquires };
        
        
        
//        self.avatars = @{kJSQDemoAvatarIdSquires : jsqImage};
//
       
        self.avatars = @{kJSQDemoAvatarIdSquires : jsqImage,
                         kJSQDemoAvatarIdCook : cookImage};
        
        
        self.users = @{kJSQDemoAvatarIdSquires :kJSQDemoAvatarDisplayNameSquires,
                       kJSQDemoAvatarIdCook : kJSQDemoAvatarDisplayNameCook};


        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] initWithBubbleImage:[UIImage jsq_bubbleRegularTaillessImage] capInsets:UIEdgeInsetsZero];
        
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor whiteColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor colorWithRed:(155/255.0) green:(186/255.0) blue:(205/255.0) alpha:1]];
    }
    return self;
}

-(void)allocMessageArray
{

    self.messages  = [[NSMutableArray alloc]init];
}
@end
