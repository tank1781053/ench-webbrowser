
//
//  EnchTechViewController.m
//  EnchTechWeb
//
//  Created by nevermore on 15/11/26.
//  Copyright © 2015年 nevermore. All rights reserved.
//

#import "EnchTechViewController.h"

@interface EnchTechViewController ()

@end

@implementation EnchTechViewController

- (id)initWithURL:(NSURL *)anURLAddress startLoadingWithBlock:(void (^)(void))startBlock andEndLoadingWithBlock:(void (^)(void))endBlock
{
    if (self == [super init])
    {
        _startBlock = startBlock;
        _endBlock = endBlock;
        urlAddress = anURLAddress;
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            self.modalPresentationStyle = UIModalPresentationPageSheet;
        else
            self.modalPresentationStyle = UIModalPresentationFullScreen;
        
        self.view.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.view.backgroundColor = [UIColor lightGrayColor];
        //self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WebView = [[WKWebView alloc] initWithFrame:CGRectMake(0.0,
                                                          20.0,
                                                          [UIScreen mainScreen].bounds.size.width,
                                                          [UIScreen mainScreen].bounds.size.height-20)];
    WebView.backgroundColor = [UIColor lightGrayColor];
    WebView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //WebView.allowsBackForwardNavigationGestures = YES;

    //WebView.delegate = self;
    //WebView.scalesPageToFit = YES;
    [self.view addSubview: WebView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlAddress];
    [WebView loadRequest:request];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateViews];
}

- (void)updateViews
{
    
    WebView.frame = CGRectMake(0.0,
                                20.0,
                                [UIScreen mainScreen].bounds.size.width,
                                [UIScreen mainScreen].bounds.size.height-20);
}

#pragma mark - Orientation Changes

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self updateViews];
}

- (void)cancelWebBrowser
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)refreshWebBrowser
{
    
    [WebView reload];
}
#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    _startBlock();
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _endBlock();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
