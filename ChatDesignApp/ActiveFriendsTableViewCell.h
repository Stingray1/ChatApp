//
//  ActiveFriendsTableViewCell.h
//  ChatDesignApp
//
//  Created by Vadim on 4/25/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActiveFriendsTableViewCell : UITableViewCell <UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *userActiveStatusCollectionView;

@property (strong, nonatomic) UIImage* testImage;
-(void)printTitle;

@end
