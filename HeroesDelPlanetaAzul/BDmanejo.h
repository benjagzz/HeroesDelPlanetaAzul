//
//  BDmanejo.h
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 20/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface BDmanejo : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) NSMutableArray *listaFrases;
@property (strong, nonatomic) NSMutableArray *listaEscudos;
@property (strong, nonatomic) NSMutableArray *listaPartidas;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//Metodos para SINGLETON
//Metodos para inicializar el Singleton
- (id) init;
+ (BDmanejo *) instancia;

//Metodos para  insertar en la base de datos
- (void) insertarFrase:(id) datosFrase;  //inserta frases del Plist al Core Data
- (void) insertarEscudo:(id) datosEscudo; //inserta escudos
- (void) insertarPartida:(id) datosPartida; //inserta datos de partida

//Metodos para cargar los datos de la Base de datos
-(NSMutableArray*)cargarFrases; //cargar frases de partida
-(NSMutableArray*)cargarPartida; //cargar partida
-(NSMutableArray*)cargarEscudos; //cargar Escudos

@end
