//
//  FriendsCell.h
//  ChatDesignApp
//
//  Created by Vadim on 4/18/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end
