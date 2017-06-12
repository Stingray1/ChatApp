
//
//  ActiveFriendsCollectionViewCell.m
//  ChatDesignApp
//
//  Created by Vadim on 4/25/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "ActiveFriendsCollectionViewCell.h"

@implementation ActiveFriendsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
   // [self.userProfileImage setImage:[UIImage imageNamed:@"demo_avatar_jobs"]];
    self.userProfileImage.layer.cornerRadius = self.userProfileImage.frame.size.width/2;
    self.userProfileImage.layer.borderWidth = 3.0f;
    self.userProfileImage.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.userStatus.layer.cornerRadius = self.userStatus.frame.size.width/2;
    self.userStatus.layer.borderWidth = 1.0f;
    self.userStatus.layer.borderColor = [UIColor whiteColor].CGColor;
}

@end
