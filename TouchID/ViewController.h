//
//  ViewController.h
//  TouchID
//
//  Created by DotiNaresh on 18/04/16.
//  Copyright © 2016 DotiNaresh . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthenticatedViewController.h"
#include <LocalAuthentication/LocalAuthentication.h>

@interface ViewController : UIViewController

{
    NSString *strippedReplacementError,*authErrorDesc ;
}

@end

