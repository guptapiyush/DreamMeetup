//
//  ViewController.m
//  DreamMeetup
//
//  Created by Gautam Madaan on 3/10/15.
//  Copyright (c) 2015 Gautam Madaan. All rights reserved.
//

#import "FBLogin.h"

@interface FBLogin ()

@end

@implementation FBLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.loginView.delegate = self;
    self.loginView.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    if ([FBSession activeSession].isOpen == YES){
        NSLog(@"Yayy");
        [self.loginView removeFromSuperview];
    } else {
        NSLog(@"WTF");
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//************************ Implement delegated methods of FaceBook Login API ***************************//

- (void)loginViewFetchedUserInfo:(FBLoginView *)loginView
                            user:(id<FBGraphUser>)user {
    [self.loginView removeFromSuperview];
    [self redirectAfterFBLogin];
    NSLog(@"Fetched UserInfo");
    User *appUser = [[User alloc] init];
    [appUser setProfileInformation:user.objectID email:[user objectForKey:@"email"] firstName:user.first_name
                          lastName:user.last_name gender:[user objectForKey:@"gender"]];
     
    
}

// Handle possible errors that can occur during login
- (void)loginView:(FBLoginView *)loginView handleError:(NSError *)error {
    NSString *alertMessage, *alertTitle;
    
    // If the user should perform an action outside of you app to recover,
    // the SDK will provide a message for the user, you just need to surface it.
    // This conveniently handles cases like Facebook password change or unverified Facebook accounts.
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        alertTitle = @"Facebook error";
        alertMessage = [FBErrorUtility userMessageForError:error];
        
        // This code will handle session closures that happen outside of the app
        // You can take a look at our error handling guide to know more about it
        // https://developers.facebook.com/docs/ios/errors
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession) {
        alertTitle = @"Session Error";
        alertMessage = @"Your current session is no longer valid. Please log in again.";
        
        // If the user has cancelled a login, we will do nothing.
        // You can also choose to show the user a message if cancelling login will result in
        // the user not being able to complete a task they had initiated in your app
        // (like accessing FB-stored information or posting to Facebook)
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        NSLog(@"user cancelled login");
        
        // For simplicity, this sample handles other errors with a generic message
        // You can checkout our error handling guide for more detailed information
        // https://developers.facebook.com/docs/ios/errors
    } else {
        alertTitle  = @"Something went wrong";
        alertMessage = @"Please try again later.";
        NSLog(@"Unexpected error:%@", error);
    }
    
    if (alertMessage) {
        [[[UIAlertView alloc] initWithTitle:alertTitle
                                    message:alertMessage
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}

//******************* End of FB delegate Methods **********************************//

// Switch to next Page after Login
- (void) redirectAfterFBLogin{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        FillFirstList *fillFirstView = (FillFirstList *)[storyboard instantiateViewControllerWithIdentifier:@"FillFirstList"];
        [self presentViewController:fillFirstView animated:NO completion:nil];
}

@end
