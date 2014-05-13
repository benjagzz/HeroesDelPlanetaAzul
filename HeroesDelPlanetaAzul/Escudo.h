//
//  Escudo.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 21/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Juego;

@interface Escudo : NSManagedObject

@property (nonatomic, retain) NSString * foto; //variable que obtiene la imagen del escudo
@property (nonatomic, retain) NSString * nombre; //variable que registra el nombre del usuario ganador
@property (nonatomic, retain) NSNumber * rangomax; //variable max para definir el escudo
@property (nonatomic, retain) NSNumber * rangomin; //variable minima para definir el escudo
@property (nonatomic, retain) NSSet *juegoRel; //relación del juego
@end

@interface Escudo (CoreDataGeneratedAccessors)

- (void)addJuegoRelObject:(Juego *)value; //agregar relación al juego
- (void)removeJuegoRelObject:(Juego *)value; //remover relación al juego
- (void)addJuegoRel:(NSSet *)values; //agregar relación
- (void)removeJuegoRel:(NSSet *)values; //remover relación

@end
