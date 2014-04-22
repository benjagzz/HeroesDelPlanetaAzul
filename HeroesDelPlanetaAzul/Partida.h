//
//  Partida.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 21/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Frase, Juego;

@interface Partida : NSManagedObject

@property (nonatomic, retain) NSNumber * puntaje;
@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSSet *fraseRel;
@property (nonatomic, retain) Juego *juegoRel;
@end

@interface Partida (CoreDataGeneratedAccessors)

- (void)addFraseRelObject:(Frase *)value;
- (void)removeFraseRelObject:(Frase *)value;
- (void)addFraseRel:(NSSet *)values;
- (void)removeFraseRel:(NSSet *)values;

@end
