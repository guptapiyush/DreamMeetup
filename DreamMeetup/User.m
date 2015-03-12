//
//  User.m
//  DreamMeetup
//
//  Created by Gautam Madaan on 3/11/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "User.h"

@implementation User

//static UIImage *profileImage;
static NSString *firstName;
static NSString *lastName;
static NSString * emailID;
static NSString *profileID;
static NSString *gender;


-(void) setProfileInformation:(NSString *)profileID email:(NSString *)emailID firstName:(NSString *)firstName
                     lastName:(NSString *) lastName gender:(NSString *)gender{
    
    profileID = profileID;
    emailID = emailID;
    firstName = firstName;
    lastName = lastName;
//    profileImage = userImage;
    gender = gender;
}

@end
