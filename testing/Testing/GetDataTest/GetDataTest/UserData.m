//
//  UserData.m
//  GetDataTest
//
//  Created by Sam Finegold on 3/2/15.
//  Copyright (c) 2015 Sam Finegold. All rights reserved.
//

#import "UserData.h"

@implementation UserData
@synthesize users;
static UserData *instance;

+(UserData*)getSharedInstance{
    if(instance ==nil)instance=[[UserData alloc]init];
    return instance;
}

-(void)getData{
    //Using tutorial: https://spring.io/guides/gs/consuming-rest-ios/
    NSURL *url = [NSURL URLWithString:@"http://localhost:3000/users/all"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {

             NSArray *_users = [NSJSONSerialization JSONObjectWithData:data
                                                        options:0
                                                          error:NULL];
//             for (NSDictionary * userObject in users){
//                 NSString *userName = userObject[@"name"];
//                 NSString *userLocation = userObject[@"location"];
//                 NSString *time = userObject[@"time"];
//                   NSLog(@"Name: %@", userName);
//                   NSLog(@"Location: %@", userLocation);
//                   NSLog(@"Time: %@", time);
//             }
             [self setValue:_users forKey:@"users"];
             self.users = _users;
             NSLog(@"User data users: %@", [self valueForKey:@"users"]);
         }
     }];
}
@end
