//
//  JuegoViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "JuegoViewController.h"

@interface JuegoViewController (){
    NSMutableArray *letrasArray;
    NSString *nombreFoto;
}

- (void)preparaArreglo;
- (void)acomodaLetras;
- (void)buscaLetra:(NSString*) letra;

@end

@implementation JuegoViewController

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
    
    [self preparaArreglo];
    
    [self acomodaLetras];
    
   // self.fraseLabel.font = [UIFont fontWithName:@"SnackerComic_PersonalUseOnly"size:48];
    
}

- (void) preparaArreglo{
    
    if (!letrasArray) {
        letrasArray = [[NSMutableArray alloc] init];
    }
    
    NSString *frase = @"En la higiene y limpieza";
    
    frase = [frase uppercaseString];
    
    //se guarda la frase en un arreglo donde cada casilla tiene una letra o espacio en blanco
    [frase enumerateSubstringsInRange:NSMakeRange(0, [frase length])
                              options:(NSStringEnumerationByComposedCharacterSequences)
                           usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                               [letrasArray addObject:substring];
                           }];
}

- (void)acomodaLetras{
    
    //acomoda los lables para que desplieguen las letras del arreglo
    for (int i = 0; i < letrasArray.count; i++){
        
        if([[letrasArray objectAtIndex:i] isEqualToString:@" "]){
            //nombreFoto = [NSString stringWithFormat:@""];
        }
        else{
            nombreFoto = [NSString stringWithFormat:@"espacioVacio.png"];
        
            switch (i) {
                case 0:
                    self.imageView1.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 1:
                    self.imageView2.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 2:
                    self.imageView3.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 3:
                    self.imageView4.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 4:
                    self.imageView5.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 5:
                    self.imageView6.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 6:
                    self.imageView7.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 7:
                    self.imageView8.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 8:
                    self.imageView9.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 9:
                    self.imageView10.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 10:
                    self.imageView11.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 11:
                    self.imageView12.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 12:
                    self.imageView13.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 13:
                    self.imageView14.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 14:
                    self.imageView15.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 15:
                    self.imageView16.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 16:
                    self.imageView17.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 17:
                    self.imageView18.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 18:
                    self.imageView19.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 19:
                    self.imageView20.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 20:
                    self.imageView21.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 21:
                    self.imageView22.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 22:
                    self.imageView23.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 23:
                    self.imageView24.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 24:
                    self.imageView25.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 25:
                    self.imageView26.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 26:
                    self.imageView27.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 27:
                    self.imageView28.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 28:
                    self.imageView29.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 29:
                    self.imageView30.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 30:
                    self.imageView31.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 31:
                    self.imageView32.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 32:
                    self.imageView33.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 33:
                    self.imageView34.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 34:
                    self.imageView35.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 35:
                    self.imageView36.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 36:
                    self.imageView37.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 37:
                    self.imageView38.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 38:
                    self.imageView39.image = [UIImage imageNamed:nombreFoto];
                    break;
            }
        }
    }
}


- (void)buscaLetra:(NSString*) letra{
    
    for (int i = 0; i < letrasArray.count; i++){
        
        if([[letrasArray objectAtIndex:i] isEqualToString:letra]){
            
            nombreFoto = [NSString stringWithFormat:@"espacio%@.png", letra];
            
            switch (i) {
                case 0:
                    self.imageView1.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 1:
                    self.imageView2.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 2:
                    self.imageView3.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 3:
                    self.imageView4.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 4:
                    self.imageView5.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 5:
                    self.imageView6.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 6:
                    self.imageView7.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 7:
                    self.imageView8.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 8:
                    self.imageView9.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 9:
                    self.imageView10.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 10:
                    self.imageView11.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 11:
                    self.imageView12.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 12:
                    self.imageView13.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 13:
                    self.imageView14.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 14:
                    self.imageView15.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 15:
                    self.imageView16.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 16:
                    self.imageView17.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 17:
                    self.imageView18.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 18:
                    self.imageView19.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 19:
                    self.imageView20.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 20:
                    self.imageView21.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 21:
                    self.imageView22.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 22:
                    self.imageView23.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 23:
                    self.imageView24.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 24:
                    self.imageView25.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 25:
                    self.imageView26.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 26:
                    self.imageView27.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 27:
                    self.imageView28.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 28:
                    self.imageView29.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 29:
                    self.imageView30.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 30:
                    self.imageView31.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 31:
                    self.imageView32.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 32:
                    self.imageView33.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 33:
                    self.imageView34.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 34:
                    self.imageView35.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 35:
                    self.imageView36.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 36:
                    self.imageView37.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 37:
                    self.imageView38.image = [UIImage imageNamed:nombreFoto];
                    break;
                case 38:
                    self.imageView39.image = [UIImage imageNamed:nombreFoto];
                    break;
            }
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"inicio"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"guardar"]) {
    }
}




#pragma mark - Botones

- (IBAction)botonA:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"A"];
}

- (IBAction)botonB:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"B"];
}

- (IBAction)botonC:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"C"];
}

- (IBAction)botonD:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"D"];
}

- (IBAction)botonE:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"E"];
}

- (IBAction)botonF:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"F"];
}

- (IBAction)botonG:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"G"];
}

- (IBAction)botonH:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"H"];
}

- (IBAction)botonI:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"I"];
}

- (IBAction)botonJ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"J"];
}

- (IBAction)botonK:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"K"];
}

- (IBAction)botonL:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"L"];
}

- (IBAction)botonM:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"M"];
}

- (IBAction)botonN:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"N"];
}

- (IBAction)botonO:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"O"];
}

- (IBAction)botonP:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"P"];
}

- (IBAction)botonQ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"Q"];
}

- (IBAction)botonR:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"R"];
}

- (IBAction)botonS:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"S"];
}

- (IBAction)botonT:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"T"];
}

- (IBAction)botonU:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"U"];
}

- (IBAction)botonV:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"V"];
}

- (IBAction)botonW:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"W"];
}

- (IBAction)botonX:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"X"];
}

- (IBAction)botonY:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"Y"];
}

- (IBAction)botonZ:(id)sender {
    UIButton *theButton = (UIButton *)sender;
    theButton.enabled = NO;
    [self buscaLetra:@"Z"];
}
@end
