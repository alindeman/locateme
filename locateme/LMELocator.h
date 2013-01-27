//
//  LMELocator.h
//  locateme
//
//  Created by ADML on 2013-01-27.
//  Copyright (c) 2013 Andy Lindeman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LMELocator : NSObject <CLLocationManagerDelegate>

+ (BOOL)locationServicesEnabled;

- (void)locateMe:(void(^)(CLLocation *location))success error:(void(^)(NSError *error))error;

@end
