//
//  Frase.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 21/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Partida;

@interface Frase : NSManagedObject

@property (nonatomic, retain) NSString * apoyo;
@property (nonatomic, retain) NSString * frase;
@property (nonatomic, retain) NSString * imagen;
@property (nonatomic, retain) NSSet *partidaRel;
@end

@interface Frase (CoreDataGeneratedAccessors)

- (void)addPartidaRelObject:(Partida *)value;
- (void)removePartidaRelObject:(Partida *)value;
- (void)addPartidaRel:(NSSet *)values;
- (void)removePartidaRel:(NSSet *)values;

@end
