//
//  NetworkStatus.m
//  NetworkStatus
//
//  Created by  on 11/12/07.
//  Copyright 2011 itoz.jp All rights reserved.
//

#import "NetworkStatus.h"
#import "FlashRuntimeExtensions.h"
#import "FBNetworkReachability.h"
#import "NetworkStatusNotification.h"

@implementation NetworkStatus

@end

FREContext g_ctx;
NetworkStatusNotification *notif;

//---------------------------------------------------------
//
//
//　現在の接続状況を返す
//
//

FREObject GetNetworkStatus(FREContext ctx, void* funcData, uint32_t argc, FREObject argv[]){
    
    NSLog(@"[INFO] GetNetworkStatus");
    const char *str = [[notif getNetworkState] UTF8String];
    FREObject retStr;
    FRENewObjectFromUTF8(strlen(str)+1, (const uint8_t *)str, &retStr);
    return retStr;
}


void NetworkStatusContextInitializer(void* extData
                                    , const uint8_t* ctxType
                                    , FREContext ctx
                                    ,uint32_t* numFunctionsToTest
                                    , const FRENamedFunction** functionsToSet) {
    
    *numFunctionsToTest = 1;
    
    FRENamedFunction* func = (FRENamedFunction*)malloc(sizeof(FRENamedFunction)*1);
    func[0].name = (const uint8_t*)"getNetworkStatus";
    func[0].functionData = NULL;
    func[0].function = &GetNetworkStatus;
               
    *functionsToSet = func;
    
    g_ctx = ctx;

    notif = [[NetworkStatusNotification alloc] init];
    [notif createNetworkReachability:@"create notif" context:ctx];
    NSLog(@"[INFO] NetworkStatus ContextInitializer");
}

void NetworkStatusContextFinalizer(FREContext ctx) {
    return;
}

void NetworkStatusExtInitializer(void** extDataToSet, FREContextInitializer* ctxInitializerToSet,
                                FREContextFinalizer* ctxFinalizerToSet) {
    *extDataToSet = NULL;
    *ctxInitializerToSet = &NetworkStatusContextInitializer;
    *ctxFinalizerToSet = &NetworkStatusContextFinalizer;
    NSLog(@"[INFO] NetworkStatus ExtInitializer");

}

void NetworkStatusExtFinalizer(void* extData) {
     //[netstatus release];
    return;
}

