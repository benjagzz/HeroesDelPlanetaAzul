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
//función que guarda lo mandado al BDmanejo.m
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
	}
	
	return self;
}

//declara una instancia de la base
+ (BDmanejo *)instancia
{
	static BDmanejo *_instancia = nil;
	static dispatch_once_t safer;
	
	dispatch_once(&safer, ^(void){
		_instancia = [[BDmanejo alloc] init];
	});
	
	return _instancia;
}


//función para insertar la frase de acuerdo al id recibido
-(void) insertarFrase:(id)datosFrase
{
	NSManagedObjectContext *context = self.managedObjectContext;
	Frase *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Frase" inManagedObjectContext:context];
	
	NSDictionary *frase = (NSDictionary *)datosFrase;
	nueva.frase = [frase objectForKey:@"frase"]; //despliega frase
	nueva.apoyo = [frase objectForKey:@"apoyo"]; //despliega apoyo
    nueva.imagen = [frase objectForKey:@"imagen"]; //despliega imagen
    
    [self saveContext]; //llama al save context
    
}

//función para insertar el escudo
-(void) insertarEscudo:(id)datosEscudo
{
	NSManagedObjectContext *context = self.managedObjectContext;
	Escudo *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Escudo" inManagedObjectContext:context];
	
	NSDictionary *frase = (NSDictionary *)datosEscudo;
	nueva.nombre = [frase objectForKey:@"nombre"]; //lo busca por su nombre
	nueva.foto = [frase objectForKey:@"foto"]; //lo busca por su imagen
    nueva.rangomin = [frase objectForKey:@"rangomin"]; //lo busca por su rango max
    nueva.rangomax = [frase objectForKey:@"rangomax"]; //lo busca por su rango minimo
    
    [self saveContext];
    
}

//función para insertar partidad
- (void) insertarPartida:(id) datosPartida
{
    NSManagedObjectContext *context = self.managedObjectContext;
	Partida *nueva = [NSEntityDescription insertNewObjectForEntityForName:@"Partida" inManagedObjectContext:context];
	
	NSDictionary *partida = (NSDictionary *)datosPartida; //busca la partida
	nueva.nombre = [partida objectForKey:@"nombre"]; //guarda el nombre del usuario
	nueva.puntaje = [partida objectForKey:@"puntos"]; //guarda el puntaje del usuario
    
    [self saveContext]; //llama al save context
    
}

//función para cargar las frases
-(NSMutableArray*)cargarFrases
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Frase" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Frase *temp;
	
    //si el resultado de buscar la frase es igual a 0, no despleiga las frases
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
                                           [temp valueForKey:@"frase"], @"frase", //obtiene la frase a buscar
                                           [temp valueForKey:@"apoyo"], @"apoyo", //obtiene el apoyo de la frase
                                           [temp valueForKey:@"imagen"], @"imagen", nil]; //obtiene la imagen de la frase
            
            [self.listaFrases addObject:miDicc]; //manda la lista de frases
        }
        return self.listaFrases; //regresa la lista de la frase
	}
}

//carga la partida
-(NSMutableArray*)cargarPartida{
    
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Partida" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Partida *temp;
	
    //si el resultado de buscar la partida es igual a 0, no despleiga la partida
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
                                           [temp valueForKey:@"nombre"], @"nombre", //obtiene el nombre
                                           [temp valueForKey:@"puntaje"], @"puntaje", nil]; //obtiene el puntaje
            
            [self.listaPartidas addObject:miDicc];
        }
        return self.listaPartidas;
	}

}

//función para cargar los escudos
-(NSMutableArray*)cargarEscudos
{
    NSManagedObjectContext *context = self.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Escudo" inManagedObjectContext:context];
	[request setEntity:entity];
	
	NSError *error;
	NSMutableArray *results = (NSMutableArray*)[context executeFetchRequest:request error:&error];
    Frase *temp;
	
    //si el resultado de buscar los escudos es igual a 0, no despleiga los escudos
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
                                           [temp valueForKey:@"nombre"], @"nombre", //despliega el nombre
                                           [temp valueForKey:@"foto"], @"foto", //despliega la foto
                                           [temp valueForKey:@"rangomin"], @"rangomin", //despliega el rango min
                                           [temp valueForKey:@"rangomax"], @"rangomax", nil]; //despliega el rango max
            
            [self.listaEscudos addObject:miDicc];
        }
        return self.listaEscudos;
	}
}


@end
