//
//  NetworkStatusNotification.m
//  NetworkStatusNotification
//
//  Created by  on 11/12/08.
//  Copyright 2011 itoz.jp All rights reserved.
//

#import "NetworkStatusNotification.h"
#import "FBNetworkReachability.h"
#import "FlashRuntimeExtensions.h"

@implementation NetworkStatusNotification

FREContext *context;
FBNetworkReachability *network;

static  NSString *CONNECTED_NON = @"CONNECTED_NON";
static  NSString *CONNECTED_WIFI = @"CONNECTED_WIFI";
static  NSString *CONNECTED_3G = @"CONNECTED_3G";

-(void)createNetworkReachability: (NSString *)title 
                         context: (FREContext *)ctx
{
    
    context = ctx;
    network = [FBNetworkReachability sharedInstance]; 
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(_didChangeConnectionMode:) 
                                                 name:FBNetworkReachabilityDidChangeNotification
                                               object:nil];
    
    [[FBNetworkReachability sharedInstance] startNotifier];
    
}

//---------------------------------------------------------
//
//　ネットワーク変化した
//

- (void) _didChangeConnectionMode:(NSNotification*)notification
{
    
    NSLog(@"[INFO] _didChangeConnectionMode");
    NSString* networkState=[self getNetworkState];
    FREDispatchStatusEventAsync (context, (uint8_t*)[networkState UTF8String], (uint8_t*)[ @"" UTF8String]);
}


//---------------------------------------------------------
//
// 接続状況取得
//

-(NSString*) getNetworkState 
{    
    FBNetworkReachabilityConnectionMode mode = network.connectionMode;
    
    NSString  *status = CONNECTED_NON;
    switch (mode) {
        case FBNetworkReachableNon:
            // 未接続
            status = CONNECTED_NON;
            break;
            
        case FBNetworkReachableWiFi:
            // WiFi接続
            status=CONNECTED_WIFI;
            break;
            
        case FBNetworkReachableWWAN:
            status = CONNECTED_3G;
            // 3G接続
            break;
    }
    return status ;
}
@end

