//
//  ProtocoloGuardar.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 20/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ProtocoloGuardar <NSObject>

-(void) insertar: (id) datos; //Función utilizada para insertar los datos.

-(void) removerVista; //Función utilizada para remover la vista.

@end
