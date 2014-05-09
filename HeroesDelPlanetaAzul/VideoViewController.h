//
//  VideoViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 09/05/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sonidos.h"

@interface VideoViewController : UIViewController
- (IBAction)regresarButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
