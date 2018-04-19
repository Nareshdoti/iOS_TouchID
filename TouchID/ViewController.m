//
//  ViewController.m
//  TouchID
//
//  Created by  on 18/04/16.
//  Copyright © 2016 . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}
-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear: YES];
    
    strippedReplacementError=@"";
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Authenticate Using TouchID";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        AuthenticatedViewController *authView=[self.storyboard instantiateViewControllerWithIdentifier:@"Success"];
                                        [self presentViewController:authView animated:YES completion:nil];
                                        
//                                        [self performSegueWithIdentifier:@"Success" sender:nil];
                                    });
                                } else {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        
                                        NSString *str1=[NSString stringWithFormat:@"%@", error.userInfo];
                                        
                                        NSArray *separatedarr1 = [str1 componentsSeparatedByString: @"="];
                                        
                                        if (separatedarr1.count>=1)
                                        {
                                         NSString *str2=[separatedarr1 objectAtIndex:1];
                                        
                                        NSCharacterSet *charactersToRemove = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
                                         strippedReplacementError = [[str2 componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@" "];
                                        
                                        }
                                        
                                        
                                UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Touch ID Error !" message:strippedReplacementError
                                                                                                  preferredStyle:UIAlertControllerStyleAlert];
                                    
                                UIAlertAction* interNet = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                                                   {
                                                                       UIApplication *app = [UIApplication sharedApplication];
                                                                       [app performSelector:@selector(suspend)];
                                                                       //wait 2 seconds while app is going background
                                                                       [NSThread sleepForTimeInterval:0.2];
                                                                       //exit app when app is in background
                                                                       exit(0);

                                                                   }];
                                        
                                [alert addAction:interNet];
                                        
                                [self presentViewController:alert animated:YES completion:nil];
                                    // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
                                    });
                                }
                            }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSString *str1=[NSString stringWithFormat:@"%@", authError.userInfo];
            
            NSArray *separatedarr1 = [str1 componentsSeparatedByString: @"="];
            
            if (separatedarr1.count>=1)
            {
                NSString *str2=[separatedarr1 objectAtIndex:1];
                
                NSCharacterSet *charactersToRemove = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
                authErrorDesc = [[str2 componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@" "];
                
            }
            
            UIAlertController * alert=   [UIAlertController alertControllerWithTitle:@"Touch ID Error !" message:authErrorDesc
                                                                      preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* interNet = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
                                       {
                                           UIApplication *app = [UIApplication sharedApplication];
                                           [app performSelector:@selector(suspend)];
                                           //wait 2 seconds while app is going background
                                           [NSThread sleepForTimeInterval:0.2];
                                           //exit app when app is in background
                                           exit(0);

                                           
                                       }];
            
            [alert addAction:interNet];

            [self presentViewController:alert animated:YES completion:nil];
            // Rather than show a UIAlert here, use the error to determine if you should push to a keypad for PIN entry.
        });
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
