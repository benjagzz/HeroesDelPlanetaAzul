//
//  AjustesViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 
//  Copyright (c) 2014 AriFlores. All rights reserved.
// 

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "WoopViewController.h"
#import "Sonidos.h"

@interface AjustesViewController : UIViewController

@property (strong, nonatomic) id musicaFondo;
- (IBAction)regresarButton:(id)sender;
- (IBAction)sonidoSwitch:(id)sender;
- (IBAction)musicaSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *sonidoOutlet;//switch que maneja el sonido
@property (weak, nonatomic) IBOutlet UISwitch *musicaOutlet;//switch que maneja la musica
@end
