//
//  CenterController.h
//  MU106
//
//  Created by Alex Lifantyev on 04.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Route.h"
#import "RouteListController.h"

@interface CenterController : UIViewController

@property (strong, nonatomic) Route *currentRoute;
@property (strong, nonatomic) RouteListController *sidePanel;

- (IBAction)addToFavorites:(id)sender;

- (void) updateRightBarButton;

@end
