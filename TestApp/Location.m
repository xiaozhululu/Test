//
//  Location.m
//  TestApp
//
//  Created by NSF on 15/2/28.
//  Copyright (c) 2015年 NSF. All rights reserved.
//

#import "Location.h"

@interface Location ()
{
    CLLocationManager *_manager;
}
@end

@implementation Location

+ (instancetype)sharedInstance
{
    static Location *sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        CLLocationManager *manager = [[CLLocationManager alloc] init];
        manager.desiredAccuracy = kCLLocationAccuracyBest;
        manager.distanceFilter = kCLDistanceFilterNone;
        manager.delegate = self;
        _manager = manager;
    }
    return self;
}

- (void)startLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        [_manager startUpdatingLocation];
    }
}

- (void)stopLocation
{
    [_manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self stopLocation];
    NSLog(@"%@", locations);
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    
}

@end
