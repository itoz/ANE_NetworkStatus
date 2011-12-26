//
//  NetworkStatusNotification.h
//  NetworkStatusNotification
//
//  Created by  on 11/12/08.
//  Copyright 2011 itoz.jp rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashRuntimeExtensions.h"
#import "FBNetworkReachability.h"

@interface NetworkStatusNotification : NSObject{}

-(void) createNetworkReachability: (NSString *)title 
                           context: (FREContext *)context;

-(void) _didChangeConnectionMode:(NSNotification*)notification;

-(NSString*) getNetworkState ;

@end
