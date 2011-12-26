//
//  NetworkStatus.h
//  NetworkStatus
//
//  Created by  on 11/12/07.
//  Copyright 2011 itoz.jp All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FlashRuntimeExtensions.h"

@interface NetworkStatus : NSObject{}

@end

FREObject GetNetworkStatus(FREContext ctx,void* funcData,uint32_t argc,FREObject arg[]);

FREObject DebugNetworkStatusEvent(FREContext ctx,void* funcData,uint32_t argc,FREObject arg[]);

void NetworkStatusContextInitializer(
                                    void* extData,
                                    const uint8_t* ctxType,
                                    FREContext ctx,
                                    uint32_t* numFunctionsToTest,
                                    const FRENamedFunction** functionsToSet
                                    );

void  NetworkStatusContextFinalizer(FREContext ctx);

void  NetworkStatusExtInitializer(
                                void** extDataToSet,
                                FREContextInitializer* ctxInitializerToSet,
                                FREContextFinalizer* ctxFinalizerToSet
                                );

void  NetworkStatusExtFinalizer(void* extData);
