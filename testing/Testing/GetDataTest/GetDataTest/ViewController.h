//
//  ViewController.h
//  GetDataTest
//
//  Created by Sam Finegold on 3/2/15.
//  Copyright (c) 2015 Sam Finegold. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserData.h"
@interface ViewController : UIViewController{
    UserData *userObject;
}
@property (nonatomic,strong)UserData *user;

@end

