//
//  PuntajesViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "BDmanejo.h"

@interface PuntajesViewController : UIViewController

@property (strong, nonatomic) id detailItem;

- (IBAction)regresarButton:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *nombre1Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje1Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre2Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje2Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre3Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje3Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre4Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje4Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre5Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje5Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre6Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje6Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre7Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje7Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre8Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje8Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre9Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje9Label;
@property (weak, nonatomic) IBOutlet UILabel *nombre10Label;
@property (weak, nonatomic) IBOutlet UILabel *puntaje10Label;


@end
