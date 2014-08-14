//
//  BNRItemsViewController.m
//  Homepwner
//
//  Created by Krzysztof Kula on 30.07.2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemsViewController ()
@property (nonatomic, strong) IBOutlet UIView *headerView;
@end

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [[[BNRItemStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"
                                           forIndexPath:indexPath];
    
    NSArray *items = [[BNRItemStore sharedStore] allItems];
    BNRItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item description];
    
    return cell;
}

- (UIView *)headerView
{
    //if you have not loaded the headerView yet
    if(!_headerView) {
        //Load HeaderView.xib
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}

- (IBAction)addNewItem:(id)sender
{
    //create a new BNRItem and add it to the store
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    
    //figure out where item is in the array
    NSInteger lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    //insert this new row into the table
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditMode:(id)sender
{
    //if you are currently in editing mode
    if (self.isEditing) {
        //change text to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        //turn off editing mode
        [self setEditing:NO animated:YES];
    } else {
        //change text of button to inform user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        
        //enter editing mode
        [self setEditing:YES animated:YES];
    }

}

- (IBAction)toggleEditingMode:(id)sender
{
}

@end
