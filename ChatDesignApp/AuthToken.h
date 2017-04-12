//
//  AuthToken.h
//  NetWorkManager
//
//  Created by Vadim on 3/22/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AuthToken : NSObject

@property (nonatomic,strong) NSString *token;

+(AuthToken *)sharedToken;
@end
