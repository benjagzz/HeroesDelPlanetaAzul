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

@property (nonatomic, retain) NSNumber * puntaje; //variable que obtiene el puntaje
@property (nonatomic, retain) NSString * nombre; //variable que obtiene el nombre
@property (nonatomic, retain) NSSet *fraseRel; //relación de la frase
@property (nonatomic, retain) Juego *juegoRel; //relación del juego
@end

@interface Partida (CoreDataGeneratedAccessors)

- (void)addFraseRelObject:(Frase *)value; //agregar frase a relación
- (void)removeFraseRelObject:(Frase *)value; //remover frase
- (void)addFraseRel:(NSSet *)values; //agregar relación
- (void)removeFraseRel:(NSSet *)values; //remover relación

@end
