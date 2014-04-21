//
//  WoopViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 25/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "WoopViewController.h"
#import "InstrViewController.h"
#import "AjustesViewController.h"
#import "PuntajesViewController.h"
#import "JuegoViewController.h"
#import "guardarViewController.h"

@interface WoopViewController (){
    NSMutableArray *lista;        //sirve para verificar que haya datos en el CoreData
    NSMutableArray *listaFrases;  //contiene las frases obtenidas del CoreData
}

-(void) cargarFrasesPlist;

@end

@implementation WoopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!lista) {
        lista = [[NSMutableArray alloc] init];
    }
    
    [self cargarFrasesPlist]; //se cargan las frases del Plist al Core Data
    
    if (!listaFrases) {
        listaFrases = [[NSMutableArray alloc] init];
    }
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios cargarFrases];
    
    listaFrases = servicios.listaFrases;  //se guarda en listaFrases la lista de frases obtenidas del coreData
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) cargarFrasesPlist{
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    lista = [servicios cargarFrases];
    
    if (!lista) {
        
        lista = [[NSMutableArray alloc]init];
        
        NSBundle *miBundle = [NSBundle mainBundle];
        
        NSString *path = [miBundle pathForResource:@"frases" ofType:@"plist"];
        
        NSMutableArray *misFrases = [NSMutableArray arrayWithContentsOfFile:path];
        
        for (int i = 0; i < [misFrases count]; i++)
        {
            [lista addObject:misFrases[i]];
        }
        
        for (int i = 0; i < [misFrases count]; i++)
        {
            NSDictionary *object = lista[i];
            
            //inserta los datos de la lista en el CoreData
            NSDictionary *fraseEntidad = [[NSDictionary alloc] initWithObjectsAndKeys: [object objectForKey:@"frase"], @"frase",[object objectForKey:@"apoyo"], @"apoyo", [object objectForKey:@"imagen"], @"imagen", nil];
            
            BDmanejo *servicios = [BDmanejo instancia];
            
            [servicios insertarFrase:fraseEntidad];  //se insertan los datos de la frase leída al CoreData
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) removerVista {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"instrucciones"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"puntajes"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"ajustes"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"jugar"]) {
    }
}



@end
