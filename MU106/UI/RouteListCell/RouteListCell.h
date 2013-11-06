//
//  RouteListCell.h
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RouteListCell : UITableViewCell
    
    @property (weak, nonatomic) IBOutlet UIImageView *imgStarred;
    @property (weak, nonatomic) IBOutlet UILabel *lblRoute;
    @property (weak, nonatomic) IBOutlet UILabel *lblPrice;
    @property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end
