//
//  CenterController.m
//  MU106
//
//  Created by Alex Lifantyev on 04.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "CenterController.h"
#import "SidePanelController.h"

@interface CenterController ()

@end



@implementation CenterController

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
	
    [self updateRightBarButton];
    // Do any additional setup after loading the view.
    //[self.navigationItem setTitle:NSLocalizedString(@"ALL ROUTES", nil)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateRightBarButton
{

    if (_currentRoute.isStarred) {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"star_active"];
    } else {
        self.navigationItem.rightBarButtonItem.image = [UIImage imageNamed:@"star_inactive"];

    }

}

- (IBAction)addToFavorites:(id)sender {
    
    self.currentRoute.isStarred = !self.currentRoute.isStarred;
    [self updateRightBarButton];
    [self.sidePanel updateViewConstraints];
    
//    SidePanelController *leftPanel = self.parentViewController.leftPanel;
//    [leftPanel reloadData];
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
//                                                    message:@"Added to favorites!"
//                                                   delegate:self
//                                          cancelButtonTitle:@"OK"
//                                          otherButtonTitles:nil];
//    [alert show];
    
}


@end