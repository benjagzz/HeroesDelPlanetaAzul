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

@interface AjustesViewController : UIViewController

@property (strong, nonatomic) id musicaFondo;
- (IBAction)regresarButton:(id)sender;
- (IBAction)sonidoSwitch:(id)sender;
- (IBAction)musicaSwitch:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *sonidoOutlet;
@property (weak, nonatomic) IBOutlet UISwitch *musicaOutlet;
//@property BOOL musica;
//@property BOOL sonido;

@end
