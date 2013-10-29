//
//  RouteListDataSource.m
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "RouteListDataSource.h"

@interface RouteListDataSource()

@property (strong, nonatomic) NSMutableArray *modelRoutes;
@property (strong, nonatomic) NSMutableArray *modelFavoriteRoutes;

@end

@implementation RouteListDataSource

- (id) init
{
    if (self = [super init]) {
        
        self.modelRoutes = [[NSMutableArray alloc] initWithObjects:@"Route 1", @"Route 2", @"Route 3", @"Route 4", @"Route 5", @"Route 6", @"Route 7", @"Route 8", @"Route 9", @"Route 10", nil];
        self.modelFavoriteRoutes = [[NSMutableArray alloc] initWithObjects:@"Fav Route 1", @"Fav Route 2", @"Fav Route 3", @"Fav Route 4", @"Fav Route 5", @"Fav Route 6", @"Fav Route 7", @"Fav Route 8", @"Fav Route 9", @"Fav Route 10", nil];
    }
    return  self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2; //We have to groups: Starred and not starred
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    if (section == 0) {
        rows = self.modelFavoriteRoutes.count;
    } else {
        rows = self.modelRoutes.count;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RouteListCell";

    NSString *label;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (indexPath.section == 0) {
        label = [self.modelFavoriteRoutes objectAtIndex:indexPath.row];
    } else {
        label = [self.modelRoutes objectAtIndex:indexPath.row];
    }
    cell.textLabel.text = label;
    //NSLog(@"IP = %d", indexPath);
    // Configure the cell...
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *header;
    if (section == 0) {
        header = NSLocalizedString(@"FAVORITES", nil);
    } else {
        header = NSLocalizedString(@"ROUTES", nil);
    }
    return header;
}

@end
