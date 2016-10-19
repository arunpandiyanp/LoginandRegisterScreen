//
//  ViewController.h
//  Login
//
//  Created by arun pandiyan  on 17/10/16.
//  Copyright © 2016 arun pandiyan . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UIButton *registerBtn;
    IBOutlet UIButton *loginBtn;
    IBOutlet UITextField *usernameField;
    IBOutlet UITextField *passwordField;
    IBOutlet UITextField *reEnterPasswordField;
    

    
}
-(IBAction)registerUser;
-(IBAction)LoginUser;

@end

