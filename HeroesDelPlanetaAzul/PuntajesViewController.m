//
//  PuntajesViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "PuntajesViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface PuntajesViewController (){
    NSMutableArray *listaPartidas;
    AVAudioPlayer *audioPlayer;
    NSString *boolSonido;
}

- (void)ordenaArreglo;
- (void)desplegarPuntajes;
- (NSString*)cargarEscudos:(int) puntos;

@end

@implementation PuntajesViewController

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios cargarPartida];
    
    if (!listaPartidas) {
        listaPartidas = [[NSMutableArray alloc] init];
    }
    
    listaPartidas = servicios.listaPartidas;
    
    [self ordenaArreglo];
    
    [self desplegarPuntajes];
}

-(void)ordenaArreglo{
    NSSortDescriptor *SortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"puntaje" ascending:NO];
    NSArray *elArray = [[NSArray alloc]initWithArray:listaPartidas];
    elArray = [elArray sortedArrayUsingDescriptors:@[SortDescriptor]];
    listaPartidas = (NSMutableArray*)elArray;
}

- (void)desplegarPuntajes{
    
    for (int i = 0; i < listaPartidas.count; i++){
        
        NSDictionary *objeto = [listaPartidas objectAtIndex:i];
        NSString *nombre = [objeto valueForKey:@"nombre"];
        NSString *puntaje = [NSString stringWithFormat:@"%@", [objeto valueForKey:@"puntaje"]];
        
        switch (i) {
            case 0:
                self.nombre1Label.text = nombre;
                self.puntaje1Label.text = puntaje;
                self.escudo1Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 1:
                self.nombre2Label.text = nombre;
                self.puntaje2Label.text = puntaje;
                self.escudo2Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 2:
                self.nombre3Label.text = nombre;
                self.puntaje3Label.text = puntaje;
                self.escudo3Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 3:
                self.nombre4Label.text = nombre;
                self.puntaje4Label.text = puntaje;
                self.escudo4Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 4:
                self.nombre5Label.text = nombre;
                self.puntaje5Label.text = puntaje;
                self.escudo5Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 5:
                self.nombre6Label.text = nombre;
                self.puntaje6Label.text = puntaje;
                self.escudo6Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 6:
                self.nombre7Label.text = nombre;
                self.puntaje7Label.text = puntaje;
                self.escudo7Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 7:
                self.nombre8Label.text = nombre;
                self.puntaje8Label.text = puntaje;
                self.escudo8Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 8:
                self.nombre9Label.text = nombre;
                self.puntaje9Label.text = puntaje;
                self.escudo9Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
            case 9:
                self.nombre10Label.text = nombre;
                self.puntaje10Label.text = puntaje;
                self.escudo10Imagen.image = [UIImage imageNamed:[self cargarEscudos:[[objeto valueForKey:@"puntaje" ] integerValue]]];
                break;
        }
    }
    
}

- (NSString*)cargarEscudos:(int) puntos{
    
    NSNumber  *punt = [NSNumber numberWithInteger: puntos];
    NSString *nombreFoto;
    
    if ([punt integerValue] <= 715){
         nombreFoto = [NSString stringWithFormat:@"escudoBronce.png"];
    }
    else if ([punt integerValue] <= 1430 && [punt integerValue] >= 716){
        nombreFoto = [NSString stringWithFormat:@"escudoPlata.png"];
    }
    else if ([punt integerValue] >= 1431){
        nombreFoto = [NSString stringWithFormat:@"escudoOro.png"];
    }
    
    return nombreFoto;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"inicio"]) {
    }
}


- (IBAction)regresarButton:(id)sender {
    
    [self sonidoBoton];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
