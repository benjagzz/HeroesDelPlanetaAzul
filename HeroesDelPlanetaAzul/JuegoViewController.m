//
//  JuegoViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "JuegoViewController.h"

@interface JuegoViewController ()

@end

@implementation JuegoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // self.fraseLabel.font = [UIFont fontWithName:@"SnackerComic_PersonalUseOnly"size:48];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"inicio"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"guardar"]) {
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)botonA:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonB:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonC:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonD:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonE:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonF:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonG:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonH:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonI:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonJ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonK:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonL:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonM:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonN:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonO:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonP:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonQ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonR:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonS:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonT:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonU:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonV:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonW:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonX:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonY:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}

- (IBAction)botonZ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
}
@end
