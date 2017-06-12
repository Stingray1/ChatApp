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
#import "ActiveFriendsTableViewCell.h"
#import "FriendsContent.h"
#import "ActiveFriendsCollectionViewCell.h"
#import "RequestManager.h"

@interface FriendsViewController ()<UITableViewDelegate,UITableViewDataSource> {

}

@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableViewWithCell];
    [self.friendsTableView setEstimatedRowHeight:300];
    [self.friendsTableView setRowHeight:UITableViewAutomaticDimension];
    CGRect frame = CGRectMake(0, 0, 375, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:13.0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines =0;
    label.text = @"Messages";
    self.navigationItem.titleView = label;
    

    
}

-(void)initTableViewWithCell
{
    [self.friendsTableView registerNib:[UINib nibWithNibName:@"ActiveFriendsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ActiveFriendsTableViewCell"];
    
      [self.friendsTableView registerNib:[UINib nibWithNibName:@"FriendsCell" bundle:nil] forCellReuseIdentifier:@"FriendCell"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"Active Friends";
    }
    else
    {
        return  @"Recent";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)];
    UILabel *headerTitle = [[UILabel alloc]initWithFrame:CGRectMake(0,0,tableView.bounds.size.width,20)];
    [headerTitle setTextColor:[UIColor colorWithRed:(179/255.0) green:(179/255.0) blue:(180/255.0) alpha:1]];
    [headerView setBackgroundColor:[UIColor colorWithRed:(245/255.0) green:(244/255.0) blue:(252/255.0) alpha:1]];
    
 
    if(section == 0)
    {
        headerTitle.text = @"Active Friends";
    }
    else{
           headerTitle.text = @"Recent";
    }
    headerTitle.textAlignment = NSTextAlignmentCenter ;
    [headerTitle setFont:[UIFont systemFontOfSize:12]];
    [headerTitle setCenter:headerView.center];
    [headerView addSubview:headerTitle];

    
    return headerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section != 0) {
        return 5;
    }
    else {
    return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0 && indexPath.section == 0)
    {
    ActiveFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActiveFriendsTableViewCell"];
        cell.testImage = [UIImage imageNamed:@"demo_avatar_woz"];
//        ActiveFriendsCollectionViewCell* celll = (ActiveFriendsCollectionViewCell *)[cell.userActiveStatusCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathWithIndex:0]];
//        celll.userProfileImage.image =[UIImage imageNamed:@"demo_avatar_woz"];
//        [cell.userActiveStatusCollectionView reloadData];
    return cell;
    }
    NSLog(@"indexpath %ld",(long)indexPath.row);
    if(indexPath.section == 1) {
        
    FriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
        if(indexPath.row == 0)
    {
       
        cell.avatarImageView.image =[UIImage imageNamed:@"demo_avatar_jobs"];
        
    }
    else{
        cell.avatarImageView.image =[UIImage imageNamed:@"demo_avatar_cook"];
    }
    return cell;
    
    }
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"StandartCellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"StandartCellID"];
    }
    
    return cell;
 
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0)
    {
        DemoMessageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoMessageViewController"];
        vc.name =@"Vadim Plasiciuc";
        vc.userID = @"26";
        [RequestManager sharedManager].messagesArray = [[NSMutableArray alloc]init];
               [self.navigationController pushViewController:vc animated:YES];
        
    }
    else{
        DemoMessageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"DemoMessageViewController"];
        vc.demoData = [[DemoModel alloc]init];
        [RequestManager sharedManager].messagesArray = [[NSMutableArray alloc]init];
        vc.name =@"Roma Cosciuc";
        vc.userID = @"23";
     
         [self.navigationController pushViewController:vc animated:YES];
    }

    
}


@end
