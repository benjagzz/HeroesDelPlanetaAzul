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

-(void)buscarSonido:(NSString *) buscar;
-(NSString *)mandarSonido;

-(void)buscarMusica:(NSString *) buscar;
-(NSString *)mandarMusica;
@end
