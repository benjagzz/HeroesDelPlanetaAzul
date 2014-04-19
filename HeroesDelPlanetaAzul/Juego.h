//
//  Juego.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 19/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Partida;

@interface Juego : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *partidaRel;
@property (nonatomic, retain) NSSet *escudoRel;
@end

@interface Juego (CoreDataGeneratedAccessors)

- (void)addPartidaRelObject:(Partida *)value;
- (void)removePartidaRelObject:(Partida *)value;
- (void)addPartidaRel:(NSSet *)values;
- (void)removePartidaRel:(NSSet *)values;

- (void)addEscudoRelObject:(NSManagedObject *)value;
- (void)removeEscudoRelObject:(NSManagedObject *)value;
- (void)addEscudoRel:(NSSet *)values;
- (void)removeEscudoRel:(NSSet *)values;

@end
