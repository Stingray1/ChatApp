//
//  FriendsCell.m
//  ChatDesignApp
//
//  Created by Vadim on 4/18/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "FriendsCell.h"

@implementation FriendsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width/2;
    self.avatarImageView.clipsToBounds = YES;
    self.avatarImageView.layer.borderWidth = 3.0f;
    self.avatarImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
