//
//  PuntajesViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "PuntajesViewController.h"

@interface PuntajesViewController (){
    NSMutableArray *listaPartidas;
}

- (void)ordenaArreglo;
- (void)desplegarPuntajes;

@end

@implementation PuntajesViewController

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
                break;
            case 1:
                self.nombre2Label.text = nombre;
                self.puntaje2Label.text = puntaje;
                break;
            case 2:
                self.nombre3Label.text = nombre;
                self.puntaje3Label.text = puntaje;
                break;
            case 3:
                self.nombre4Label.text = nombre;
                self.puntaje4Label.text = puntaje;
                break;
            case 4:
                self.nombre5Label.text = nombre;
                self.puntaje5Label.text = puntaje;
                break;
            case 5:
                self.nombre6Label.text = nombre;
                self.puntaje6Label.text = puntaje;
                break;
            case 6:
                self.nombre7Label.text = nombre;
                self.puntaje7Label.text = puntaje;
                break;
            case 7:
                self.nombre8Label.text = nombre;
                self.puntaje8Label.text = puntaje;
                break;
            case 8:
                self.nombre9Label.text = nombre;
                self.puntaje9Label.text = puntaje;
                break;
            case 9:
                self.nombre10Label.text = nombre;
                self.puntaje10Label.text = puntaje;
                break;
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"inicio"]) {
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)regresarButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
