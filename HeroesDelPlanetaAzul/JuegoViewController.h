//
//  JuegoViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "BDmanejo.h"

@interface JuegoViewController : UIViewController

@property (strong, nonatomic) id detailItem;

- (IBAction)regresarButton:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *siguienteButton;
@property (weak, nonatomic) IBOutlet UIButton *videoButton;

- (IBAction)siguienteButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saltarFraseButton;
@property (weak, nonatomic) IBOutlet UIButton *salirButton;
- (IBAction)salirButton:(id)sender;
- (IBAction)saltarFraseButton:(id)sender;

- (IBAction)postFacebook:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *regresarButton;
@property (weak, nonatomic) IBOutlet UIImageView *monedaImageVew;
@property (weak, nonatomic) IBOutlet UIImageView *gotaImageView;

- (IBAction)postTwitter:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *felicidadesImageView;

@property (weak, nonatomic) IBOutlet UIImageView *fotoImageView;

@property (weak, nonatomic) IBOutlet UILabel *erroresLabel;

@property (weak, nonatomic) IBOutlet UILabel *puntosLabel;

@property (weak, nonatomic) IBOutlet UILabel *fraseLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@property (weak, nonatomic) IBOutlet UIImageView *imageView5;
@property (weak, nonatomic) IBOutlet UIImageView *imageView6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView7;
@property (weak, nonatomic) IBOutlet UIImageView *imageView8;
@property (weak, nonatomic) IBOutlet UIImageView *imageView9;
@property (weak, nonatomic) IBOutlet UIImageView *imageView10;
@property (weak, nonatomic) IBOutlet UIImageView *imageView11;
@property (weak, nonatomic) IBOutlet UIImageView *imageView12;
@property (weak, nonatomic) IBOutlet UIImageView *imageView13;
@property (weak, nonatomic) IBOutlet UIImageView *imageView14;
@property (weak, nonatomic) IBOutlet UIImageView *imageView15;
@property (weak, nonatomic) IBOutlet UIImageView *imageView16;
@property (weak, nonatomic) IBOutlet UIImageView *imageView17;
@property (weak, nonatomic) IBOutlet UIImageView *imageView18;
@property (weak, nonatomic) IBOutlet UIImageView *imageView19;
@property (weak, nonatomic) IBOutlet UIImageView *imageView20;
@property (weak, nonatomic) IBOutlet UIImageView *imageView21;
@property (weak, nonatomic) IBOutlet UIImageView *imageView22;
@property (weak, nonatomic) IBOutlet UIImageView *imageView23;
@property (weak, nonatomic) IBOutlet UIImageView *imageView24;
@property (weak, nonatomic) IBOutlet UIImageView *imageView25;
@property (weak, nonatomic) IBOutlet UIImageView *imageView26;
@property (weak, nonatomic) IBOutlet UIImageView *imageView27;
@property (weak, nonatomic) IBOutlet UIImageView *imageView28;
@property (weak, nonatomic) IBOutlet UIImageView *imageView29;
@property (weak, nonatomic) IBOutlet UIImageView *imageView30;
@property (weak, nonatomic) IBOutlet UIImageView *imageView31;
@property (weak, nonatomic) IBOutlet UIImageView *imageView32;
@property (weak, nonatomic) IBOutlet UIImageView *imageView33;
@property (weak, nonatomic) IBOutlet UIImageView *imageView34;
@property (weak, nonatomic) IBOutlet UIImageView *imageView35;
@property (weak, nonatomic) IBOutlet UIImageView *imageView36;
@property (weak, nonatomic) IBOutlet UIImageView *imageView37;
@property (weak, nonatomic) IBOutlet UIImageView *imageView38;
@property (weak, nonatomic) IBOutlet UIImageView *imageView39;

@property (weak, nonatomic) IBOutlet UIButton *botonA;
@property (weak, nonatomic) IBOutlet UIButton *botonB;
@property (weak, nonatomic) IBOutlet UIButton *botonC;
@property (weak, nonatomic) IBOutlet UIButton *botonD;
@property (weak, nonatomic) IBOutlet UIButton *botonE;
@property (weak, nonatomic) IBOutlet UIButton *botonF;
@property (weak, nonatomic) IBOutlet UIButton *botonG;
@property (weak, nonatomic) IBOutlet UIButton *botonH;
@property (weak, nonatomic) IBOutlet UIButton *botonI;
@property (weak, nonatomic) IBOutlet UIButton *botonJ;
@property (weak, nonatomic) IBOutlet UIButton *botonK;
@property (weak, nonatomic) IBOutlet UIButton *botonL;
@property (weak, nonatomic) IBOutlet UIButton *botonM;
@property (weak, nonatomic) IBOutlet UIButton *botonN;
@property (weak, nonatomic) IBOutlet UIButton *botonO;
@property (weak, nonatomic) IBOutlet UIButton *botonP;
@property (weak, nonatomic) IBOutlet UIButton *botonQ;
@property (weak, nonatomic) IBOutlet UIButton *botonR;
@property (weak, nonatomic) IBOutlet UIButton *botonS;
@property (weak, nonatomic) IBOutlet UIButton *botonT;
@property (weak, nonatomic) IBOutlet UIButton *botonU;
@property (weak, nonatomic) IBOutlet UIButton *botonV;
@property (weak, nonatomic) IBOutlet UIButton *botonW;
@property (weak, nonatomic) IBOutlet UIButton *botonX;
@property (weak, nonatomic) IBOutlet UIButton *botonY;
@property (weak, nonatomic) IBOutlet UIButton *botonZ;


- (IBAction)botonA:(id)sender;
- (IBAction)botonB:(id)sender;
- (IBAction)botonC:(id)sender;
- (IBAction)botonD:(id)sender;
- (IBAction)botonE:(id)sender;
- (IBAction)botonF:(id)sender;
- (IBAction)botonG:(id)sender;
- (IBAction)botonH:(id)sender;
- (IBAction)botonI:(id)sender;
- (IBAction)botonJ:(id)sender;
- (IBAction)botonK:(id)sender;
- (IBAction)botonL:(id)sender;
- (IBAction)botonM:(id)sender;
- (IBAction)botonN:(id)sender;
- (IBAction)botonO:(id)sender;
- (IBAction)botonP:(id)sender;
- (IBAction)botonQ:(id)sender;
- (IBAction)botonR:(id)sender;
- (IBAction)botonS:(id)sender;
- (IBAction)botonT:(id)sender;
- (IBAction)botonU:(id)sender;
- (IBAction)botonV:(id)sender;
- (IBAction)botonW:(id)sender;
- (IBAction)botonX:(id)sender;
- (IBAction)botonY:(id)sender;
- (IBAction)botonZ:(id)sender;

@end
