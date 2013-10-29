//
//  RouteListDataSource.m
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "RouteListDataSource.h"
#import "UI.h"

@interface RouteListDataSource()

@property (strong, nonatomic) NSMutableArray *modelRoutes;
@property (strong, nonatomic) NSMutableArray *modelFavoriteRoutes;

@end

@implementation RouteListDataSource

- (id) init
{
    if (self = [super init]) {
        
        self.modelRoutes = [[NSMutableArray alloc] init];
        self.modelFavoriteRoutes = [[NSMutableArray alloc] init];
        
        for (int i=1; i<=10; i++) {
            [self.modelRoutes addObject:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"ROUTE", nil), i]];
            [self.modelFavoriteRoutes addObject:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"ROUTE", nil), i]];
        }
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
    RouteListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[RouteListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
//    if (cell == nil) {
//        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"DynamicReportCell"];
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RouteListCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }

    NSString *label;
    
    if (indexPath.section == 0) {
        label = [self.modelFavoriteRoutes objectAtIndex:indexPath.row];
    } else {
        label = [self.modelRoutes objectAtIndex:indexPath.row];
    }
    cell.lblRoute.text = label;
    cell.lblPrice.text = @"12345";
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68.f;
}
    
@end
