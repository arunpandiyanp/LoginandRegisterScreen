//
//  ViewController.m
//  Login
//
//  Created by arun pandiyan  on 17/10/16.
//  Copyright © 2016 arun pandiyan . All rights reserved.
//

#import "ViewController.h"
#import "login.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    if(![defaults boolForKey:@"registered"])
    {
        NSLog(@"no user registered");
        loginBtn.hidden=YES;//hideloginbuttonwhileregistertheuser
    }
    else
    {
        NSLog(@"USer is registerd");
        reEnterPasswordField.hidden=YES;
        registerBtn.hidden=YES;//hideregisterandreenterpasswordbutton
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)registerUser
{
    
    if([usernameField.text isEqualToString:@""]||[passwordField.text isEqualToString:@""]||[reEnterPasswordField.text isEqualToString:@""]){
        UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"You must Complete All Field" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [error show];
//        login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
//        [self presentViewController:sec animated:YES completion:nil];
//
    }
    else
    {
        [self checkPasswordsMatch];
    }
    }

-(void)checkPasswordsMatch
{
    
    if([passwordField.text isEqualToString:reEnterPasswordField.text])
    {
        NSLog(@"password match");
        [self registerNewUser];
    }
    
    else
    
    {
        NSLog(@"Password does not Match");
        UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Password Not Match" message:@"your password and reenter password not match please check" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [error show];
    
    }
}
-(void)registerNewUser

{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:usernameField.text forKey:@"username"];
    [defaults setObject:passwordField.text forKey:@"password"];
    [defaults setBool:YES forKey:@"registered"]; //username and password match
    [defaults synchronize];
    UIAlertView *sucess=[[UIAlertView alloc]initWithTitle:@"user login sucess" message:@"login" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    
      login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
      [self presentViewController:sec animated:YES completion:nil];
    usernameField.text=@"";
    passwordField.text=@"";
    reEnterPasswordField.text=@"";
    
    //

    //[self performSegueWithIdentifier:@"login" sender:self];
    
    }
    
-(IBAction)LoginUser
    {
        
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        if([usernameField.text isEqualToString:[defaults objectForKey:@"username"]]&&[passwordField.text isEqualToString:[defaults objectForKey:@"password"]])
        {
        
            NSLog(@"login succeed");
            //[self performSegueWithIdentifier:@"login" sender:self];
            usernameField.text=nil;                passwordField.text=nil;
            login *sec=[self.storyboard instantiateViewControllerWithIdentifier:@"login"];
            [self presentViewController:sec animated:YES completion:nil];
            usernameField.text=@"";
            passwordField.text=@"";

        
        }
        else
        {
            NSLog(@"login unsuccess");
            
            UIAlertView *error=[[UIAlertView alloc]initWithTitle:@"Password Not Match" message:@"your password and username incorrect" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [error show];
            
        }
        
        
    }
    
    
    




@end
