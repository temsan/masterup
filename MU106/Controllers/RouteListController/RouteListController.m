//
//  RouteListController.m
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "RouteListController.h"
#import "UI.h"

@interface RouteListController ()

    @property (strong, nonatomic) NSMutableArray *modelRoutes;
    @property (strong, nonatomic) NSMutableArray *modelFavoriteRoutes;
    
@end

@implementation RouteListController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ApiRouteClient *sharedRouteClient = [ApiRouteClient sharedInstance];
    sharedRouteClient.delegate = self;
    [sharedRouteClient updateRoutesList];
    
    [self.navigationItem setTitle:NSLocalizedString(@"ALL ROUTES", nil)];
    self.modelRoutes = [[NSMutableArray alloc] init];
    self.modelFavoriteRoutes = [[NSMutableArray alloc] init];
    
    
//    for (int i=1; i<=10; i++) {
//        [self.modelRoutes addObject:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"ROUTE", nil), i]];
//        [self.modelFavoriteRoutes addObject:[NSString stringWithFormat:@"%@ %d",NSLocalizedString(@"ROUTE", nil), i]];
//    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    Route *obj = [self.modelRoutes objectAtIndex:indexPath.row];
    UIImage *imgStar;
    if (obj.isStarred) {
        imgStar = [UIImage imageNamed:@"star_active"];
        cell.tag = 1;
    } else {
        imgStar = [UIImage imageNamed:@"star_inactive"];
        cell.tag = 0;
    }
    
    //NSNumber *price = [NSNumber numberWithLong: random()%30+1];
    cell.lblRoute.text = obj.title;
    cell.lblPrice.text = [NSString stringWithFormat:@"%@ %@", obj.price, NSLocalizedString(@"SHORT CURRENCY", nil)];
    [cell.imgStarred setImage:imgStar];
    
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

#pragma mark - Table view delegate
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RouteListCell *cell = (RouteListCell *)[tableView cellForRowAtIndexPath:indexPath];
    if (cell.tag == 1) {
        //NSLog(@"HIGHLITED !!!");
    } else {
        //NSLog(@" NOT HIGHLITED !!!");
    }
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Height of cell in Storyboard
    return 53.f;
}

#pragma mark - ApiRouteClient delegate

- (void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(id)routes
{
    //NSError *error = nil;
    //NSData *data = [routes dataUsingEncoding:NSUTF8StringEncoding];
    //NSArray *array = [NSJSONSerialization JSONObjectWithData:routes options:kNilOptions error:&error];
    //NSLog(@"Response API %@", routes);
    NSEnumerator *enumerator = [routes objectEnumerator];
    id obj;
    while ((obj = [enumerator nextObject]))
    {
        Route *route = [[Route alloc] initWithDictionary:(NSDictionary *)obj];
        [self.modelRoutes addObject:route];
        [self.tableView reloadData];
        //NSLog(@"Route obj = %@", route);
        
    }
}

- (void)ApiRouteClient:(ApiRouteClient *)client didFailWithError:(NSError *)error
{
    NSLog(@"Error API %@", error.description);
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
