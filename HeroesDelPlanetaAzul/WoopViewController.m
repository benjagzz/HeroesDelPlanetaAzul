//
//  WoopViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 25/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "WoopViewController.h"

@interface WoopViewController ()

@end

@implementation WoopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"instrucciones"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"puntajes"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"ajustes"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"jugar"]) {
    }
}



@end
