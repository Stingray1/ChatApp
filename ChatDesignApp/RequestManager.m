//
//  RequestManager.m
//  NetWorkManager
//
//  Created by Vadim on 3/20/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

#import "RequestManager.h"
#import <AFNetworking.h>
#import "AuthToken.h"
@interface RequestManager()

@property (nonatomic,strong) AFHTTPSessionManager *requestManager;

@end

@implementation RequestManager

+(RequestManager *)sharedManager
{
    static RequestManager * manager =nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RequestManager alloc]init];
    });
    
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"http://35.187.72.36/"];
        self.requestManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
        
        
    }
    return self;
}

-(void) loginWithEmail :(NSString *)email
         username:(NSString *)username
           password:(NSString *)password onSucces:(void(^)(NSString *response)) success onFail:(void(^)(NSError * error,NSInteger statusCode)) failure

{
//    if ([[NSUserDefaults standardUserDefaults] stringForKey:@"token"] <= 0) {
//        
    
        
        [self.requestManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [self.requestManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
        
        NSDictionary* authParameters = @{@"grant_type": @"password",
                                         @"username" : username,
                                         @"password" : password,
                                         @"client_id": @"TMZfVOHHMoBC0lBniwXpa6htljw0v5topwdBcimi"
                                         };
        
        
        [self.requestManager POST:@"oauth/token/"
                  parameters:authParameters
                    progress:nil
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        
                         NSLog(@"Response object %@", responseObject);
                         
                         [AuthToken sharedToken].token = [NSString stringWithFormat:@"Bearer %@", responseObject[@"access_token"]];
                         NSLog(@"Token %@", [AuthToken sharedToken].token);
                         [[NSUserDefaults standardUserDefaults] setObject:[AuthToken sharedToken].token forKey:@"token"];
                         
                     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         
                         NSLog(@"%@", error);
                         
                     }];
        
        
        
//    }
    
//    else {
//        NSLog(@"user defaults %@", [[NSUserDefaults standardUserDefaults] stringForKey:@"token"]);
//        [self.requestManager.requestSerializer setValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"token"] forHTTPHeaderField:@"Authorization"];
//        
//    }
}



-(void)logout
{
    
//    //// Request header cu token la logout
//    [self.requestManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self.requestManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
//    [self.requestManager POST:@"rest-auth/logout/" parameters:nil progress:nil
//    
//       success:^(NSURLSessionTask *task, id responseObject)
//     {
//         NSLog(@"JSON: %@", responseObject);
//        
//     } failure:^(NSURLSessionTask *operation, NSError *error) {
//         NSLog(@"Error: %@", error);
//         NSLog(@"Error = %@", error);
//         NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
//         NSLog(@"%@",errResponse);
//        
//     }
//     ];
    

}
-(void)registerUserWithFirstName:(NSString *)firsName LastName:(NSString *)lastName userName:(NSString *)userName sex:(NSString *)gender password:(NSString *)password email:(NSString *)email andBirthday:(NSString *)birthday onSucces:(void(^)(NSString * response))success ofFail:(void (^)(NSError *error,NSInteger statusCode)) failure
{
    
    [self.requestManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [self.requestManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [self.requestManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    NSLog(@"%@ %@ %@ %@ %@ %@ ,%@",firsName,lastName,password,email,gender,birthday, userName);
    NSDictionary *parameters = @{ @"is_ios":@(true),
                                  @"password": password,
                                  @"username": userName,
                                  @"location": @"Chisinau",
                                  @"email": email
                                 };
    
    NSLog(@"%@",parameters);
    [self.requestManager POST:@"oauth/register/" parameters:parameters progress:nil success:^(NSURLSessionDataTask *task,id response)
     {
         
           if(success)
         {
             success(response);
         }
         
         
     }failure:^(NSURLSessionDataTask *task, NSError *error)
     
     { NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
         NSLog(@"Error: %@", error);
         NSLog(@"Error = %@", error);
         NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
         NSLog(@"%@",errResponse);
         if(failure)
         {
             failure(error,httpResponse.statusCode);
         }
     }
     
     ];
}

-(void)sendMessage:(NSString *)message andId:(NSString *)userId
{
    
    NSDictionary *parameters = @{ @"text":message,
                                  @"seen": @(false)
                                  };
    [self.requestManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [self.requestManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [self.requestManager.requestSerializer setValue:[AuthToken sharedToken].token forHTTPHeaderField:@"Authorization"];
   
    [self.requestManager POST:[NSString stringWithFormat:@"messages/%@/send/",userId] parameters:parameters progress:nil
     success:^(NSURLSessionTask *task, id responseObject)
     {
         NSLog(@"JSON: %@", responseObject);
         
     } failure:^(NSURLSessionTask *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         NSLog(@"Error = %@", error);
         NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
         NSLog(@"%@",errResponse);
         
     }
     ];
}

-(void)getMessagefromID:(NSString *)userId onSucces:(void(^)(NSString *response)) success onFail:(void(^)(NSError * error,NSInteger statusCode)) failure
{
    
  
    [self.requestManager.requestSerializer setValue:[AuthToken sharedToken].token forHTTPHeaderField:@"Authorization"];

//    [self.requestManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
//    [self.requestManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    [self.requestManager GET:@"messages/23/" parameters:nil progress:nil
                      success:^(NSURLSessionTask *task, id responseObject)
     {
         
         NSLog(@"RESPONSE OBJECT %@",responseObject);
         
         NSMutableArray* post = [responseObject mutableCopy];
         NSDictionary *dics = [post firstObject];
         
         NSLog(@"dics %@",dics);
         NSString *name = [dics valueForKey:@"text"];
         
         
        //         NSMutableArray *message = [objects mutableCopy];
     
        // NSLog(@"mesajul este  %@",message);

         if(success)
         {
             success(name);
         }
         
     } failure:^(NSURLSessionTask *operation, NSError *error) {
         NSLog(@"Error: %@", error);
         NSLog(@"Error = %@", error);
         NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
         NSLog(@"%@",errResponse);
         
     }
     ];

    
   }

@end
