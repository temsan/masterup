//
//  ApiRouteClient.h
//  MU106
//
//  Created by Alex Lifantyev on 06.11.13.
//  Copyright (c) 2013 Instup.com. All rights reserved.
//

#import "AFHTTPClient.h"

@protocol ApiRouteClientDelegate;

@interface ApiRouteClient : AFHTTPClient

@property (weak) id<ApiRouteClientDelegate> delegate;

+ (id)sharedInstance;
- (id)initWithBaseURL:(NSURL *)url;

- (void)updateRoutesList;

@end

@protocol ApiRouteClientDelegate <NSObject>

-(void)ApiRouteClient:(ApiRouteClient *)client didUpdateRoutes:(id)routes;
-(void)ApiRouteClient:(ApiRouteClient *)client didFailWithError:(NSError *)error;

@end