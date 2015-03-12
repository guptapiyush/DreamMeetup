//
//  User.h
//  DreamMeetup
//
//  Created by Gautam Madaan on 3/11/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface User : NSObject

-(void) setProfileInformation:(NSString *)profileID email:(NSString *)emailID firstName:(NSString *) firstName
                     lastName:(NSString *) lastName gender:(NSString *) gender;


@end
