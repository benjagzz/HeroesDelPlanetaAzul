//
//  Sonidos.h
//  HeroesDelPlanetaAzul
//
//  Created by Benjamin Gonzalez on 5/9/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sonidos : NSObject{
    NSString *prueba;
}

@property (nonatomic, retain) NSString *prueba;

+ (id)sharedManager;


//función para buscar si los sonidos estan on/off
-(void)buscarSonido:(NSString *) buscar;
//función que regresa el estado
-(NSString *)mandarSonido;

//función para buscar si la musica esta on/off
-(void)buscarMusica:(NSString *) buscar;
//función que regresa el estado
-(NSString *)mandarMusica;
@end
