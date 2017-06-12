//
//  FriendsListViewController.h
//  ChatDesignApp
//
//  Created by Vadim on 5/30/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendsListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *friendsListTableView;

@end
