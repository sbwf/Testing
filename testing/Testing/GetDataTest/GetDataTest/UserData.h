//
//  UserData.h
//  GetDataTest
//
//  Created by Sam Finegold on 3/2/15.
//  Copyright (c) 2015 Sam Finegold. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserData : NSObject{
}
@property (nonatomic,strong) NSArray *users;

+(UserData*)getSharedInstance;
-(void)getData;

@end
