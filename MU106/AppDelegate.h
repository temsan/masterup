//
//  AppDelegate.h
//  MU106
//
//  Created by Alex Lifantyev on 29.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import "AFNetworking.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (strong, nonatomic) NSManagedObjectContext *managedContext;

@property (strong, nonatomic) NSPersistentStoreCoordinator *storeCoordinator;

@property (strong, nonatomic) NSManagedObjectModel *managedModel;

@end
