//
//  SidePanelController.m
//  MU106
//
//  Created by Alex Lifantyev on 04.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "SidePanelController.h"
#import "RouteListController.h"
#import "CenterController.h"

@interface SidePanelController ()

@end

@implementation SidePanelController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) awakeFromNib
{
    
    RouteListController *routePanel = [self.storyboard instantiateViewControllerWithIdentifier:@"RouteListID"];
    [self setLeftPanel:routePanel];
    
    CenterController *centerView = [self.storyboard instantiateViewControllerWithIdentifier:@"CenterID"];
    [self setCenterPanel:centerView];
    
    routePanel.centerView = centerView;
//    centerView.sidePanel = routePanel;
    
    //[self setRightPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"rightViewController"]];
}

@end
