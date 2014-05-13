//
//  WoopViewController.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 25/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProtocoloGuardar.h"
#import "BDmanejo.h"
#import "Sonidos.h"

@interface WoopViewController : UIViewController
- (IBAction)playButton:(id)sender; //boton para llevar a la interfaz de jugar
- (IBAction)instrButton:(id)sender; //boton para llevar a la interfaz de instrucciones
- (IBAction)puntButton:(id)sender; //boton para llevar a la interfaz de puntaje
- (IBAction)ajustButton:(id)sender; //boton para llevar a la interfaz de ajustes
- (IBAction)creditosButton:(id)sender; //boton para llevar a la interfaz de creditos


@end
