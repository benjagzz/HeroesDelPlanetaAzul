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

@property (nonatomic, retain) NSString * apoyo; //variable para obtener la frase apoyo.
@property (nonatomic, retain) NSString * frase; //variable para identificar la frase por adivinar
@property (nonatomic, retain) NSString * imagen; //variable para obtener la imagen de la frase
@property (nonatomic, retain) NSSet *partidaRel; //relación de la partida
@end

@interface Frase (CoreDataGeneratedAccessors)

- (void)addPartidaRelObject:(Partida *)value; //agregar partidad
- (void)removePartidaRelObject:(Partida *)value; //remover partida
- (void)addPartidaRel:(NSSet *)values; //agregar relación a partida
- (void)removePartidaRel:(NSSet *)values; //remover relación a partida 

@end
