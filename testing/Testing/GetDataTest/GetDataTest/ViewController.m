//
//  ViewController.m
//  GetDataTest
//
//  Created by Sam Finegold on 3/2/15.
//  Copyright (c) 2015 Sam Finegold. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.user = [[UserData alloc]init];
    userObject = [UserData getSharedInstance];
    [self.user addObserver:self forKeyPath:@"user" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    userObject.users = [[NSArray alloc]init];
    [userObject getData];
    NSLog(@"USERS: %@", userObject.users);
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"HERE");
    if([keyPath isEqualToString:@"user"]){
        NSLog(@"The set of users was changed.");
        NSLog(@"%@", change);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context{
    
}

@end
