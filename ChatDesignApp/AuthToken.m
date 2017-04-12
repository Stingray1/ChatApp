//
//  AuthToken.m
//  NetWorkManager
//
//  Created by Vadim on 3/22/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "AuthToken.h"



@implementation AuthToken

+(AuthToken *)sharedToken
{
    static AuthToken *authToken = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        authToken = [[AuthToken alloc] init];
    });
    return authToken;
}




@end
