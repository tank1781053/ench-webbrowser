//
//  ViewController.m
//  EnchWebBrowser
//
//  Created by nevermore on 15/11/26.
//  Copyright © 2015年 nevermore. All rights reserved.
//

#import "ViewController.h"
#import "EnchTechViewController.h"
@interface ViewController ()

@end

@implementation ViewController


@synthesize url;


- (void)viewDidLoad {
    [super viewDidLoad];
//init viewframe
    self.view.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.view.backgroundColor = [UIColor clearColor];
//set background pic
    UIImage *pic = [UIImage imageNamed:@"background.jpg"];
    UIImageView *background =[[UIImageView alloc]initWithImage:pic];
    [background setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:background];
//button entry mode
    UIButton *entry = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    entry.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 1.2, [UIScreen mainScreen].bounds.size.height / 1.2);
    entry.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    entry.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [entry setTitle:@"进入主页" forState:UIControlStateNormal];
    [entry addTarget:self action:@selector(openWebBrowser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:entry];
//delay entry modew
    [self performSelector:@selector(openWebBrowser) withObject:nil afterDelay:3.0f];
    
}

- (void)openWebBrowser
{
    
    url=[NSURL URLWithString:@"http://115.28.238.24/"];
    
    
    EnchTechViewController *webBrowser = [[EnchTechViewController alloc]
                                          initWithURL:url
                                          startLoadingWithBlock:^{
                                              NSLog(@"start loading web browser page");
                                          } andEndLoadingWithBlock:^{
                                              NSLog(@"end loading web browser page");
                                          }];
    
    [self presentViewController:webBrowser animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }

@end

