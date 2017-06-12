
#import "FriendsListViewController.h"
#import "FriendsListTableViewCell.h"
@interface FriendsListViewController ()
{
    NSMutableArray *friendsArray;
}
@end

@implementation FriendsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 0, 20, 44);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Roboto" size:17];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.numberOfLines =0;
    label.text = @"Friends 1.9k";
    self.navigationItem.titleView = label;
    
    
    [self initTableViewWithCell];
    [self.friendsListTableView setEstimatedRowHeight:300];
    [self.friendsListTableView setRowHeight:UITableViewAutomaticDimension];
    
    friendsArray = [[NSMutableArray alloc]init];
    [friendsArray addObject:@"Vadim"];
    [friendsArray addObject:@"Marcel"];
    [friendsArray addObject:@"Roma"];
    
}

-(void)initTableViewWithCell
{
    [self.friendsListTableView registerNib:[UINib nibWithNibName:@"FriendsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"FriendsListCellID"];
    
   }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return friendsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     FriendsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendsListCellID"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma Editing styles

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Unfriend" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        // maybe show an action sheet with more options
        [tableView setEditing:NO];
        [friendsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }];
    
    UITableViewRowAction *blockAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal  title:@"Block " handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        // maybe show an action sheet with more options
        [tableView setEditing:NO];
        [friendsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }];
   
    return @[deleteAction,blockAction];
}

@end
