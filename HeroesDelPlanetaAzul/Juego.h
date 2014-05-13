//
//  Juego.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 21/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Escudo, Partida;

@interface Juego : NSManagedObject

@property (nonatomic, retain) NSString * nombre; //variable para el nombre
@property (nonatomic, retain) NSSet *escudoRel; //variable apra relación del escudo
@property (nonatomic, retain) NSSet *partidaRel; //variable para relación de partida
@end

@interface Juego (CoreDataGeneratedAccessors)

- (void)addEscudoRelObject:(Escudo *)value; //agregar relación
- (void)removeEscudoRelObject:(Escudo *)value; //remover relacióne escudo
- (void)addEscudoRel:(NSSet *)values; //agregar relación
- (void)removeEscudoRel:(NSSet *)values; //remover relación

- (void)addPartidaRelObject:(Partida *)value; //agregar partida
- (void)removePartidaRelObject:(Partida *)value; //remover partida
- (void)addPartidaRel:(NSSet *)values; //agregar partida relación
- (void)removePartidaRel:(NSSet *)values; //remover partida relación

@end
