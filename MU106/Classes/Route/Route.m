//
//  Route.m
//  MU106
//
//  Created by Alex Lifantyev on 30.10.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "Route.h"

@implementation Route

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if (self = [super init]) {
        
        [self setValue: [NSNumber numberWithInt: [[dictionary objectForKey:@"route_id"] intValue]]
                forKey:@"identifier"];
        
        [self setValue: [dictionary objectForKey:@"route_title"]
                forKey:@"title"];
        
        [self setValue: [dictionary objectForKey:@"route_description"]
                forKey:@"routeDescription"];
        
        [self setValue: [NSNumber numberWithFloat: [[dictionary objectForKey:@"route_price"] floatValue]]
                forKey:@"price"];
        
        [self setValue: [dictionary objectForKey:@"route_path"]
                forKey:@"path"];
        
        [self setValue: [NSNumber numberWithInt: [[dictionary objectForKey:@"owner_id"] intValue]]
         forKey:@"ownerId"];
        
        [self setValue: NO
                forKey:@"isStarred"];
    }
    return self;
}

@end
