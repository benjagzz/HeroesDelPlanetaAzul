//
//  BDmanejo.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 20/04/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "BDmanejo.h"
#import "Escudo.h"
#import "Juego.h"
#import "Partida.h"
#import "Frase.h"
#import "WoopViewController.h"

@implementation BDmanejo

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - Core Data stack

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Modelo" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Modelo.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}
#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma-mark Singleton Methods
- (id)init
{
	if(self = [super init]){
		[self setListaFrases:[[NSMutableArray alloc] init]];
        [self setListaPartidas:[[NSMutableArray alloc] init]];
        [self setListaEscudos:[[NSMutableArray alloc] init]];
		//[self setListaVacunas:[[NSMutableArray alloc]init]];
	}
	
	return self;
}
+ (BDmanejo *)instancia
{
	static BDmanejo *_instancia = nil;
	static dispatch_once_t safer;
	
	dispatch_once(&safer, ^(void){
		_instancia = [[BDmanejo alloc] init];
	});
	
	return _instancia;
}

-(void) insertarFrase:(id)datosFrase
{
	NSManagedObjectContext *context = self.managedObjectContext;
	Frase *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Frase" inManagedObjectContext:context];
	
	NSDictionary *frase = (NSDictionary *)datosFrase;
	nueva.frase = [frase objectForKey:@"frase"];
	nueva.apoyo = [frase objectForKey:@"apoyo"];
    nueva.imagen = [frase objectForKey:@"imagen"];
    
    [self saveContext];
    
}

-(void) insertarEscudo:(id)datosEscudo
{
	NSManagedObjectContext *context = self.managedObjectContext;
	Escudo *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Escudo" inManagedObjectContext:context];
	
	NSDictionary *frase = (NSDictionary *)datosEscudo;
	nueva.nombre = [frase objectForKey:@"nombre"];
	nueva.foto = [frase objectForKey:@"foto"];
    nueva.rangomin = [frase objectForKey:@"rangomin"];
    nueva.rangomax = [frase objectForKey:@"rangomax"];
    
    [self saveContext];
    
}

- (void) insertarPartida:(id) datosPartida
{
    NSManagedObjectContext *context = self.managedObjectContext;
	Partida *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Partida" inManagedObjectContext:context];
	
	NSDictionary *partida = (NSDictionary *)datosPartida;
	nueva.nombre = [partida objectForKey:@"nombre"];
	nueva.puntaje = [partida objectForKey:@"puntos"];
    
    [self saveContext];
    
}

-(NSMutableArray*)cargarFrases
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Frase" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Frase *temp;
	
	if(results.count==0){
		NSLog(@"No hay frases guardadas...");
        return NULL;
	}else{
        if (_listaFrases) {
            _listaFrases = [[NSMutableArray alloc] init];
        }
        for (int i = 0; i < results.count; i++) {
            temp = results[i];
            NSMutableDictionary *miDicc = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                           [temp valueForKey:@"frase"], @"frase",
                                           [temp valueForKey:@"apoyo"], @"apoyo",
                                           [temp valueForKey:@"imagen"], @"imagen", nil];
            
            [self.listaFrases addObject:miDicc];
        }
        return self.listaFrases;
	}
}

-(NSMutableArray*)cargarPartida{
    
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Partida" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Partida *temp;
	
	if(results.count==0){
		NSLog(@"No hay partidas guardadas...");
        return NULL;
	}else{
        if (_listaPartidas) {
            _listaPartidas = [[NSMutableArray alloc] init];
        }
        for (int i = 0; i < results.count; i++) {
            temp = results[i];
            NSMutableDictionary *miDicc = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                           [temp valueForKey:@"nombre"], @"nombre",
                                           [temp valueForKey:@"puntaje"], @"puntaje", nil];
            
            [self.listaPartidas addObject:miDicc];
        }
        return self.listaPartidas;
	}

}

-(NSMutableArray*)cargarEscudos
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Escudo" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Frase *temp;
	
	if(results.count==0){
		NSLog(@"No hay frases guardadas...");
        return NULL;
	}else{
        if (_listaEscudos) {
            _listaEscudos = [[NSMutableArray alloc] init];
        }
        for (int i = 0; i < results.count; i++) {
            temp = results[i];
            NSMutableDictionary *miDicc = [[NSMutableDictionary alloc]initWithObjectsAndKeys:
                                           [temp valueForKey:@"nombre"], @"nombre",
                                           [temp valueForKey:@"foto"], @"foto",
                                           [temp valueForKey:@"rangomin"], @"rangomin",
                                           [temp valueForKey:@"rangomax"], @"rangomax", nil];
            
            [self.listaEscudos addObject:miDicc];
        }
        return self.listaEscudos;
	}
}


@end
