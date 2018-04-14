//
//  ViewController.m
//  NSSetTask
//
//  Created by Victor Macintosh on 14/04/2018.
//  Copyright © 2018 Victor Semenchuk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: Create NSArray, containing 30 objects. Add duplicates to array.
    NSArray *startArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                            @"1", @"12", @"3", @"14", @"15", @"16", @"7", @"8", @"19", @"20",
                            @"21", @"2", @"23", @"4", @"5", @"26", @"27", @"28", @"29", @"10"];
    //We have 8 duplicates in the array
    
    //MARK: Use NSSet to exclude duplicates from array.
    NSSet *set = [NSSet setWithArray:startArray];
    
    //MARK: Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained inside an array. Transform array into NSSet and check whether number 74 is contained inside NSSet.
    
    //Checking for array
    NSMutableArray *mutableArray100 = [[NSMutableArray alloc] init];
    for(int i = 1; i <= 100; i++) {
        [mutableArray100 addObject:[NSNumber numberWithInteger:i]];
    }
    NSLog(@">Duration for Array: ");
    [self checkDurationFor:^{
        [mutableArray100 enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj integerValue] == 74) {
                *stop = YES;
            }
        }];
    }];
    
    //Checking for set
    NSLog(@">Duration for Set: ");
    NSSet *set100 = [NSSet setWithArray:mutableArray100];
    [self checkDurationFor:^{
        [set100 containsObject:[NSNumber numberWithInteger:74]];
    }];
    
    //Releasing
    [mutableArray100 release];
}

- (void)checkDurationFor:(void(^)(void))method {
    NSDate *startTime = [NSDate date];
    method();
    NSLog(@"Time: %f", -[startTime timeIntervalSinceNow]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
