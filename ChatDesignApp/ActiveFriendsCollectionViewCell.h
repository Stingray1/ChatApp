//
//  ActiveFriendsCollectionViewCell.h
//  ChatDesignApp
//
//  Created by Vadim on 4/25/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveFriendsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;

@property (weak, nonatomic) IBOutlet UIView *userStatus;

@end
