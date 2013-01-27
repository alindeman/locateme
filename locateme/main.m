//
//  main.m
//  locateme
//
//  Created by ADML on 2013-01-27.
//  Copyright (c) 2013 Andy Lindeman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LMELocator.h"

const int kRetSuccess = 0;
const int kRetLocationError = 1;
const int kRetLocationServicesNotEnabled = 100;

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        if ([LMELocator locationServicesEnabled]) {
            LMELocator *locator = [[LMELocator alloc] init];
            [locator locateMe:^(CLLocation *location) {
                printf("%f %f\n", location.coordinate.latitude, location.coordinate.longitude);
                exit(kRetSuccess);
            } error:^(NSError *error) {
                printf("Error: %s\n", error.description.UTF8String);
                exit(kRetLocationError);
            }];
            
            [[NSRunLoop currentRunLoop] run];
            return kRetSuccess;
        } else {
            printf("Error: Location services not enabled");
            return kRetLocationServicesNotEnabled;
        }
    }
}

