//
//  Escudo.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 19/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Juego;

@interface Escudo : NSManagedObject

@property (nonatomic, retain) NSString * nombre;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSNumber * rangomin;
@property (nonatomic, retain) NSNumber * rangomax;
@property (nonatomic, retain) NSSet *juegoRel;
@end

@interface Escudo (CoreDataGeneratedAccessors)

- (void)addJuegoRelObject:(Juego *)value;
- (void)removeJuegoRelObject:(Juego *)value;
- (void)addJuegoRel:(NSSet *)values;
- (void)removeJuegoRel:(NSSet *)values;

@end
