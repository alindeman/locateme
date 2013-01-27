//
//  LMELocator.m
//  locateme
//
//  Created by ADML on 2013-01-27.
//  Copyright (c) 2013 Andy Lindeman. All rights reserved.
//

#import "LMELocator.h"

@interface LMELocator () {
    CLLocationManager *locationManager;
    
    void (^successBlock)(CLLocation *location);
    void (^errorBlock)(NSError *error);
}
@end

@implementation LMELocator

+ (BOOL)locationServicesEnabled {
    return [CLLocationManager locationServicesEnabled];
}

- (id)init {
    self = [super init];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
    }
    
    return self;
}

- (void)locateMe:(void(^)(CLLocation *location))success error:(void(^)(NSError *error))error {
    successBlock = success;
    errorBlock = error;
    
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    successBlock(newLocation);
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    errorBlock(error);
}

@end
