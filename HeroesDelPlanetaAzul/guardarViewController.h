//
//  guardarViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "BDmanejo.h"
#import "Sonidos.h"

@interface guardarViewController : UIViewController

@property (strong, nonatomic) id detailItem;
- (IBAction)guardarButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *puntosLabel;
@property (weak, nonatomic) IBOutlet UITextField *nombreTF;
@property (weak, nonatomic) IBOutlet UIImageView *escudoImageView;
- (IBAction)postFacebook:(id)sender;
- (IBAction)postTwitter:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;

@end
