//
//  EnchTechViewController.h
//  EnchTechWeb
//
//  Created by nevermore on 15/11/26.
//  Copyright © 2015年 nevermore. All rights reserved.
//

#import <WebKit/WebKit.h>
#import <UIKit/UIKit.h>

@interface EnchTechViewController : UIViewController
<WKNavigationDelegate>//<UIWebViewDelegate>
{
    //UIWebView *WebView;
    NSURL *urlAddress;
    WKWebView *WebView;
    
    void (^_startBlock)(void);
    void (^_endBlock)(void);
}

- (id)initWithURL:(NSURL *)anURLAddress startLoadingWithBlock:(void (^)(void))startBlock andEndLoadingWithBlock:(void (^)(void))endBlock;

@end
