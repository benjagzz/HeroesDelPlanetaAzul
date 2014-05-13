//
//  InstrViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "Sonidos.h"

@interface InstrViewController : UIViewController

@property (strong, nonatomic) id detailItem; //manda la variable del estado on/off
- (IBAction)regresarButton:(id)sender; //boton para regresar al menu principal

@end
