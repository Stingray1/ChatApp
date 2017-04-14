//
//  RequestManager.h
//  NetWorkManager
//
//  Created by Vadim on 3/20/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequestManager : NSObject


+(RequestManager *)sharedManager;


-(void)loginWithEmail :(NSString *)email
username:(NSString *)username
         password:(NSString *)password onSucces:(void(^)(NSString *response)) success onFail:(void(^)(NSError * error,NSInteger statusCode)) failure;

-(void)logout;

-(void)registerUserWithFirstName:(NSString *)firsName LastName:(NSString *)lastName userName:(NSString *)userName sex:(NSString *)gender password:(NSString *)password email:(NSString *)email andBirthday:(NSString *)birthday onSucces:(void(^)(NSString * response))success ofFail:(void (^)(NSError *error,NSInteger statusCode)) failure;



-(void)getMessagefromID:(NSString *)userId onSucces:(void(^)(NSDictionary *response)) success onFail:(void(^)(NSError * error,NSInteger statusCode)) failure;


-(void)sendMessage:(NSString *)message andId:(NSString *)userId;
@end
