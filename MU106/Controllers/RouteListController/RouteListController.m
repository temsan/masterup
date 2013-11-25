//
//  RouteListController.m
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <CoreData/CoreData.h>

#import "AppDelegate.h"
#import "RouteListController.h"
#import "SidePanelController.h"
#import "CenterController.h"
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
    
    NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedContext;
    
    [sharedRouteClient updateRoutesList:^(NSArray *routes) {
        
        for(id obj in routes)
        {
            Route *theRoute = [NSEntityDescription insertNewObjectForEntityForName: @"Route"
                                                            inManagedObjectContext: context];
      
            [theRoute initWithDictionary: obj];
            [self.modelRoutes addObject:theRoute];

        }
        [self.tableView reloadData];

    }
    
    Failure:^(NSError *error) {
        NSLog(@"%@", error);
    }
    ];
    
    
    [self.navigationItem setTitle:NSLocalizedString(@"ALL ROUTES", nil)];
    self.modelRoutes = [[NSMutableArray alloc] init];
    self.modelFavoriteRoutes = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
#pragma mark - Table view data source
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1; //We have to groups: Starred and not starred
}
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    //if (section == 0) {
    //    rows = self.modelFavoriteRoutes.count;
    //} else {
        rows = self.modelRoutes.count;
    //}
    return rows;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0){
        
        UITableViewCell *searchCell = [tableView dequeueReusableCellWithIdentifier:@"SearchCell"];
        return searchCell;
        
    }
    
    static NSString *CellIdentifier = @"RouteListCell";
    RouteListCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Route *obj = [self.modelRoutes objectAtIndex:indexPath.row + 1];
    
    UIImage *imgStar;
    
    if (obj.isStarred) {
        imgStar = [UIImage imageNamed:@"star_active"];
        cell.tag = 1;
    } else {
        imgStar = [UIImage imageNamed:@"star_inactive"];
        cell.tag = 0;
    }
    
    cell.lblRoute.text = obj.title;
    cell.lblPrice.text = [NSString stringWithFormat:@"%@ %@", obj.price, NSLocalizedString(@"SHORT CURRENCY", nil)];
    cell.lblDescription.text = obj.routeDescription;
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

- (void) updateTable
{

    [self.tableView reloadData];
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
    
    UINavigationController *navigationController = self.centerView;
    CenterController *centerView = [navigationController.viewControllers objectAtIndex:0];
    centerView.navigationItem.title = cell.lblRoute.text;
    
    centerView.currentRoute = [self.modelRoutes objectAtIndex:indexPath.row + 1];
    [centerView updateRightBarButton];
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Height of cell in Storyboard
    return 53.f;
}

#pragma mark - ApiRouteClient delegate

- (void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(id)routes
{
    
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
