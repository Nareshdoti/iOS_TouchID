//
//  AuthenticatedViewController.m
//  TouchID
//
//  Created by DotiNaresh on 18/04/16.
//  Copyright © 2016 DotiNaresh . All rights reserved.
//

#import "AuthenticatedViewController.h"

@interface AuthenticatedViewController ()

@end

@implementation AuthenticatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"<<Back" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.backgroundColor=[UIColor blackColor];
    
    button.frame=CGRectMake(10, 200, 100, 40);
    
    
    // Do any additional setup after loading the view.
}
-(void)buttonAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
