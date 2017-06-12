//
//  ActiveFriendsTableViewCell.m
//  ChatDesignApp
//
//  Created by Vadim on 4/25/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "ActiveFriendsTableViewCell.h"
#import "ActiveFriendsCollectionViewCell.h"
@implementation ActiveFriendsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.userActiveStatusCollectionView registerNib:[UINib nibWithNibName:@"ActiveFriendsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ActiveFriendsCollectionViewCellID"];
    
    
}

-(void)printTitle
{
    NSLog(@"Print");
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 15;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ActiveFriendsCollectionViewCell *cell = [self.userActiveStatusCollectionView dequeueReusableCellWithReuseIdentifier:@"ActiveFriendsCollectionViewCellID" forIndexPath:indexPath];
    cell.userProfileImage.image = self.testImage;
    NSLog(@"indexpath %ld",(long)indexPath.row);
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
    
}

@end
