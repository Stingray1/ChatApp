//
//  FriendsViewController.m
//  ChatDesignApp
//
//  Created by Vadim on 4/18/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "FriendsViewController.h"
#import "FriendsCell.h"
#import "DemoMessageViewController.h"
@interface FriendsViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewWithCell];
    [self.friendsTableView setEstimatedRowHeight:50];
    [self.friendsTableView setRowHeight:UITableViewAutomaticDimension];
    

}

-(void)initTableViewWithCell
{
    [self.friendsTableView registerNib:[UINib nibWithNibName:@"FriendsCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
    
    NSLog(@"indexpath %ld",(long)indexPath.row);
    if(indexPath.row == 0)
    {
        cell.avatarImageView.image =[UIImage imageNamed:@"demo_avatar_jobs"];
    }
    else{
        cell.avatarImageView.image =[UIImage imageNamed:@"demo_avatar_cook"];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    if(indexPath.row ==0)
    {
        DemoMessageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoMessageViewController"];
        vc.demoData = [[DemoModel alloc]init];
        vc.name =@"Vadim Plasiciuc";
        vc.userID = @"23";
               [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        DemoMessageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoMessageViewController"];
        vc.demoData = [[DemoModel alloc]init];
        vc.name =@"Roma Cosciuc";
        vc.userID = @"25";
        [self.navigationController pushViewController:vc animated:YES];
    }

    
}


@end
