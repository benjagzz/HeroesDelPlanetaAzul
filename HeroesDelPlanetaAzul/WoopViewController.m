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
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface WoopViewController (){
    NSMutableArray *lista;        //sirve para verificar que haya datos de las frases en el CoreData
    NSMutableArray *lista2;       //sirve para verificar que haya datos de los escudos en el CoreData
    NSMutableArray *listaFrases;  //contiene las frases obtenidas del CoreData
    NSMutableArray *listaEscudos;  //contiene las frases obtenidas del CoreData
    AVAudioPlayer *audioPlayer;
    AVAudioPlayer *audioFondo;
    NSString *boolSonido;
}
-(void) cargarFrasesPlist;
-(void) cargarEscudosPlist;

@end

@implementation WoopViewController


- (void)sonidoFondo
{
    Sonidos *servicios = [Sonidos sharedManager];
    [servicios buscarSonido:@"on"];
    [servicios buscarMusica:@"on"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"fondo" ofType:@"mp3"];
    audioFondo = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    audioFondo.numberOfLoops = -1; //infinite
    [audioFondo setVolume:1];
    [audioFondo play];
}

- (void)sonidoBoton
{
    Sonidos *servicios = [Sonidos sharedManager];
    boolSonido = [servicios mandarSonido];
    if ([boolSonido isEqualToString:@"on"]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"];
        audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
        [audioPlayer play];
    }
}

- (void)viewDidLoad
{
    [self sonidoFondo];
    [super viewDidLoad];
    
    if (!lista) {
        lista = [[NSMutableArray alloc] init];
    }
    
    if (!lista2) {
        lista2 = [[NSMutableArray alloc] init];
    }
    
    [self cargarFrasesPlist]; //se cargan las frases del Plist al Core Data
    
    [self cargarEscudosPlist];
    
    if (!listaFrases) {
        listaFrases = [[NSMutableArray alloc] init];
    }
    
    if (!listaEscudos) {
        listaEscudos= [[NSMutableArray alloc] init];
    }
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios cargarFrases];
    
    [servicios cargarEscudos];
    
    listaFrases = servicios.listaFrases;  //se guarda en listaFrases la lista de frases obtenidas del coreData
    
    listaEscudos = servicios.listaEscudos;
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


-(void) cargarEscudosPlist{
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    lista2 = [servicios cargarEscudos];
    
    if (!lista2) {
        
        lista2 = [[NSMutableArray alloc]init];
        
        NSBundle *miBundle = [NSBundle mainBundle];
        
        NSString *path = [miBundle pathForResource:@"escudos" ofType:@"plist"];
        
        NSMutableArray *misEscudos = [NSMutableArray arrayWithContentsOfFile:path];
        
        for (int i = 0; i < [misEscudos count]; i++)
        {
            [lista2 addObject:misEscudos[i]];
        }
        
        for (int i = 0; i < [misEscudos count]; i++)
        {
            NSDictionary *object = lista2[i];
            
            //inserta los datos de la lista en el CoreData
            NSDictionary *escudoEntidad = [[NSDictionary alloc] initWithObjectsAndKeys: [object objectForKey:@"nombre"], @"nombre",[object objectForKey:@"foto"], @"foto", [object objectForKey:@"rangomin"], @"rangomin",[object objectForKey:@"rangomax"], @"rangomax", nil];
            
            BDmanejo *servicios = [BDmanejo instancia];
            
            [servicios insertarEscudo:escudoEntidad];  //se insertan los datos de la frase leída al CoreData
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
        AVAudioPlayer *object = audioFondo;
        [[segue destinationViewController] setMusicaFondo:object];
    }
    
    if ([[segue identifier] isEqualToString:@"jugar"]) {
    }
}



- (IBAction)playButton:(id)sender {
    
    [self  sonidoBoton];
    
}

- (IBAction)instrButton:(id)sender {
    
    [self  sonidoBoton];
    
}

- (IBAction)puntButton:(id)sender {
    
    [self  sonidoBoton];
    
}

- (IBAction)ajustButton:(id)sender {
    
    [self  sonidoBoton];
    
}

- (IBAction)creditosButton:(id)sender {
    
    [self  sonidoBoton];
}
@end
