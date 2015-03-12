//
//  ViewController.h
//  DreamMeetup
//
//  Created by Gautam Madaan on 3/10/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "User.h"
#import "FillFirstList.h"

@interface FBLogin: UIViewController <FBLoginViewDelegate>
@property(weak, nonatomic) IBOutlet FBLoginView *loginView;

@end

