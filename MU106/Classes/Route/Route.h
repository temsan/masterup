//
//  Route.h
//  MU106
//
//  Created by Alex Lifantyev on 30.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

    @property (strong, nonatomic) NSString *routeName;
    @property (strong, nonatomic) NSNumber *cost;
    @property (nonatomic) BOOL isStarred;
    
@end
