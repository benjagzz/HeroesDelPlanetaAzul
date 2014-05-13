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
    AVAudioPlayer *audioPlayer; //sirve para obtener el sonido de los botones
    AVAudioPlayer *audioFondo; //sirve para obtener el audio de fondo
    NSString *boolSonido; //sirve para detectar si el sonido esta on o off
}
-(void) cargarFrasesPlist; //carga las frases del plist
-(void) cargarEscudosPlist; //carga los escudos del plist

@end

@implementation WoopViewController

//Función que activa el sonido de fondo
- (void)sonidoFondo
{
    Sonidos *servicios = [Sonidos sharedManager];
    [servicios buscarSonido:@"on"];
    [servicios buscarMusica:@"on"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"juego" ofType:@"mp3"];
    audioFondo = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    audioFondo.numberOfLoops = -1; //infinite
    [audioFondo setVolume:1];
    [audioFondo play];
}

//Función que activa los sonidos de los botones
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

//función que carga las frases del plist
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


//función que carga los escudos del plist
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

//va a ser utilizada para remover la vista cuando se encuentre en otra interfaz
- (void) removerVista {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

//se mandan los datos por medio del segue
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
        AVAudioPlayer *object = audioFondo;
        [[segue destinationViewController] setMusicaFondo:object];
    }
}


//acción del boton jugar
- (IBAction)playButton:(id)sender {
    
    [self  sonidoBoton];
    
}

//acción del boton instrucciones
- (IBAction)instrButton:(id)sender {
    
    [self  sonidoBoton];
    
}

//acción del boton puntaje
- (IBAction)puntButton:(id)sender {
    
    [self  sonidoBoton];
    
}

//acción del boton ajustes
- (IBAction)ajustButton:(id)sender {
    
    [self  sonidoBoton];
    
}

//acción del boton creditos
- (IBAction)creditosButton:(id)sender {
    
    [self  sonidoBoton];
}
@end
