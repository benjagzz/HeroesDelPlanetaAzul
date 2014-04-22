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

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *escudoRel;
@property (nonatomic, retain) NSSet *partidaRel;
@end

@interface Juego (CoreDataGeneratedAccessors)

- (void)addEscudoRelObject:(Escudo *)value;
- (void)removeEscudoRelObject:(Escudo *)value;
- (void)addEscudoRel:(NSSet *)values;
- (void)removeEscudoRel:(NSSet *)values;

- (void)addPartidaRelObject:(Partida *)value;
- (void)removePartidaRelObject:(Partida *)value;
- (void)addPartidaRel:(NSSet *)values;
- (void)removePartidaRel:(NSSet *)values;

@end
