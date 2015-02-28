//
//  Location.h
//  TestApp
//
//  Created by NSF on 15/2/28.
//  Copyright (c) 2015年 NSF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Location : NSObject <CLLocationManagerDelegate>

+ (instancetype)sharedInstance;

- (void)startLocation;
- (void)stopLocation;

@end
