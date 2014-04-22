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

@interface guardarViewController : UIViewController

@property (strong, nonatomic) id detailItem;
- (IBAction)guardarButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *puntosLabel;
@property (weak, nonatomic) IBOutlet UITextField *nombreTF;

@end
