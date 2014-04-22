//
//  JuegoViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "JuegoViewController.h"
#import <Social/Social.h>


@interface JuegoViewController (){
    
    NSMutableArray *letrasArray;  //Arreglo que contendra la frase a adivinar guardando una letra por casilla
    NSString *nombreFoto;
    NSString *nombreImagen;
    NSMutableArray *listaFrases;  //arreglo de diccionarios que contendrá todas las frases
    NSDictionary *datosPartida;
    
    int errores;     //cantidad de errores cometidos
    int puntos;      //variable que lleva el acumulado de puntos
    int x;           //variable que controla guarda el indice del arreglo de frase
    int cont;        //variable que lleva el acumulado de letras
    int totalLetras; //varibale que sirve de control para saber si ya adivino todas las letras
    int encontradas; //varibale que sirve de control para saber si ya adivino todas las letras
    bool activo;     //variable que permite picarle a un boton o no
    
}

- (void)preparaVista: (int)num;
- (void)preparaArreglo: (int)num;
- (void)acomodaLetras;
- (void)buscaLetra:(NSString*) letra;
- (void)terminaJuego;

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
    
    errores = 6;
    
    puntos = 0;
    
    x = 0;
    
    cont = 0;
    
    totalLetras = 0;
    
    encontradas = 0;
    
    activo = true;
    
    //sigue = true;
    
    self.erroresLabel.text = [NSString stringWithFormat:@"Errores restantes: %d", errores];
   
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios cargarFrases];
    
    listaFrases = servicios.listaFrases;
    
    self.fraseLabel.text = [NSString stringWithFormat:@"%@", [[listaFrases objectAtIndex:x] valueForKey:@"apoyo"]];
    
    nombreImagen = [NSString stringWithFormat:@"%@",[[listaFrases objectAtIndex:x] valueForKey:@"imagen"]];
    
    self.fotoImageView.image = [UIImage imageNamed:nombreImagen];
    
    [self preparaArreglo:x];
    
    [self acomodaLetras];
    
}

- (void) preparaVista:(int)num{
    
    activo = true;
    
    self.siguienteButton.hidden = true;

    self.fraseLabel.text = [NSString stringWithFormat:@"%@", [[listaFrases objectAtIndex:num] valueForKey:@"apoyo"]];
    
    nombreImagen = [NSString stringWithFormat:@"%@",[[listaFrases objectAtIndex:num] valueForKey:@"imagen"]];

    self.fotoImageView.image = [UIImage imageNamed:nombreImagen];
    
    errores = 6;
    
    self.erroresLabel.text = [NSString stringWithFormat:@"Errores restantes: %d", errores];
    
    totalLetras = 0;
    
    encontradas = 0;
    
    cont = 0;
    
    self.botonA.enabled = YES;
    self.botonB.enabled = YES;
    self.botonC.enabled = YES;
    self.botonD.enabled = YES;
    self.botonE.enabled = YES;
    self.botonF.enabled = YES;
    self.botonG.enabled = YES;
    self.botonH.enabled = YES;
    self.botonI.enabled = YES;
    self.botonJ.enabled = YES;
    self.botonK.enabled = YES;
    self.botonL.enabled = YES;
    self.botonM.enabled = YES;
    self.botonN.enabled = YES;
    self.botonO.enabled = YES;
    self.botonP.enabled = YES;
    self.botonQ.enabled = YES;
    self.botonR.enabled = YES;
    self.botonS.enabled = YES;
    self.botonT.enabled = YES;
    self.botonU.enabled = YES;
    self.botonV.enabled = YES;
    self.botonW.enabled = YES;
    self.botonX.enabled = YES;
    self.botonY.enabled = YES;
    self.botonZ.enabled = YES;
    
    self.imageView1.image = [UIImage imageNamed:NO];
    self.imageView2.image = [UIImage imageNamed:NO];
    self.imageView3.image = [UIImage imageNamed:NO];
    self.imageView4.image = [UIImage imageNamed:NO];
    self.imageView5.image = [UIImage imageNamed:NO];
    self.imageView6.image = [UIImage imageNamed:NO];
    self.imageView7.image = [UIImage imageNamed:NO];
    self.imageView8.image = [UIImage imageNamed:NO];
    self.imageView9.image = [UIImage imageNamed:NO];
    self.imageView10.image = [UIImage imageNamed:NO];
    self.imageView11.image = [UIImage imageNamed:NO];
    self.imageView12.image = [UIImage imageNamed:NO];
    self.imageView13.image = [UIImage imageNamed:NO];
    self.imageView14.image = [UIImage imageNamed:NO];
    self.imageView15.image = [UIImage imageNamed:NO];
    self.imageView16.image = [UIImage imageNamed:NO];
    self.imageView17.image = [UIImage imageNamed:NO];
    self.imageView18.image = [UIImage imageNamed:NO];
    self.imageView19.image = [UIImage imageNamed:NO];
    self.imageView20.image = [UIImage imageNamed:NO];
    self.imageView21.image = [UIImage imageNamed:NO];
    self.imageView22.image = [UIImage imageNamed:NO];
    self.imageView23.image = [UIImage imageNamed:NO];
    self.imageView24.image = [UIImage imageNamed:NO];
    self.imageView25.image = [UIImage imageNamed:NO];
    self.imageView26.image = [UIImage imageNamed:NO];
    self.imageView27.image = [UIImage imageNamed:NO];
    self.imageView28.image = [UIImage imageNamed:NO];
    self.imageView29.image = [UIImage imageNamed:NO];
    self.imageView30.image = [UIImage imageNamed:NO];
    self.imageView31.image = [UIImage imageNamed:NO];
    self.imageView32.image = [UIImage imageNamed:NO];
    self.imageView33.image = [UIImage imageNamed:NO];
    self.imageView34.image = [UIImage imageNamed:NO];
    self.imageView35.image = [UIImage imageNamed:NO];
    self.imageView36.image = [UIImage imageNamed:NO];
    self.imageView37.image = [UIImage imageNamed:NO];
    self.imageView38.image = [UIImage imageNamed:NO];
    self.imageView39.image = [UIImage imageNamed:NO];
  
    
    
    [letrasArray removeAllObjects];
    
    [self preparaArreglo:num];
    
    [self acomodaLetras];
}

- (void) preparaArreglo:(int)num{
    
    if (!letrasArray) {
        letrasArray = [[NSMutableArray alloc] init];
    }
    
    NSString *frase =  [[listaFrases objectAtIndex:num]valueForKey:@"frase"];
    
    frase = [frase uppercaseString];
    
    //se guarda la frase en un arreglo donde cada casilla tiene una letra o espacio en blanco
    [frase enumerateSubstringsInRange:NSMakeRange(0, [frase length])
                              options:(NSStringEnumerationByComposedCharacterSequences)
                           usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                               [letrasArray addObject:substring];
                           }];
}

- (void)acomodaLetras{
    
    //acomoda los labels para que desplieguen los espacios vacios de las letras del arreglo
    for (int i = 0; i < letrasArray.count; i++){
        
        if([[letrasArray objectAtIndex:i] isEqualToString:@" "]){
        }
        else{  //Si el arreglo contiene una letra despliega un espacio vacío en el imageView
            nombreFoto = [NSString stringWithFormat:@"espacioVacio.png"];
            
            totalLetras++;
        
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

- (void)buscaLetra:(NSString*) letra{  //busca la letra que se tecleó en el arreglo y las despliega en los imageView
    
    
    for (int i = 0; i < letrasArray.count; i++){
        
        if([[letrasArray objectAtIndex:i] isEqualToString:letra]){
            
            nombreFoto = [NSString stringWithFormat:@"espacio%@.png", letra];
            
            encontradas++;
            
            cont++;
            
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
    if (encontradas == 0) {
        errores--;  //se suma un error porque no se encontró la letra
        
        self.erroresLabel.text = [NSString stringWithFormat:@"Errores restantes: %d", errores];
        
        puntos = puntos - 10;
        
        self.puntosLabel.text = [NSString stringWithFormat:@"Puntos: %d", puntos];
    }
    
    else {  //si se encontró la letra, se suman 15 por letra
        puntos = puntos + 15;
        
        self.puntosLabel.text = [NSString stringWithFormat:@"Puntos: %d", puntos];
        
        encontradas = 0;
    }
}

- (void)terminaJuego{  //revisa la cantidad de errores cometidos
    
    if(errores == 0){
        //sigue = false;
        
       NSNumber  *punt = [NSNumber numberWithInteger: puntos];
        
       datosPartida = [[NSDictionary alloc] initWithObjectsAndKeys: punt, @"puntos", nil];
        
        [self performSegueWithIdentifier:@"guardar" sender:self];
        
    }
    
    if (totalLetras == cont){
        //[self performSegueWithIdentifier:@"guardar" sender:self];
        self.siguienteButton.hidden = false;
        activo = false;
    }
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Botones

- (IBAction)botonA:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"A"];
        [self terminaJuego];
    }
}

- (IBAction)botonB:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"B"];
        [self terminaJuego];
    }
}

- (IBAction)botonC:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"C"];
        [self terminaJuego];
    }
}

- (IBAction)botonD:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"D"];
        [self terminaJuego];
    }
}

- (IBAction)botonE:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"E"];
        [self terminaJuego];
    }
}

- (IBAction)botonF:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"F"];
        [self terminaJuego];
    }
}

- (IBAction)botonG:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"G"];
        [self terminaJuego];
    }
}

- (IBAction)botonH:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"H"];
        [self terminaJuego];
    }
}

- (IBAction)botonI:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"I"];
        [self terminaJuego];
    }
}

- (IBAction)botonJ:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"J"];
        [self terminaJuego];
    }
}

- (IBAction)botonK:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"K"];
        [self terminaJuego];
    }
}

- (IBAction)botonL:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"L"];
        [self terminaJuego];
    }
}

- (IBAction)botonM:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"M"];
        [self terminaJuego];
    }
}

- (IBAction)botonN:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"N"];
        [self terminaJuego];
    }
}

- (IBAction)botonO:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"O"];
        [self terminaJuego];
    }
}

- (IBAction)botonP:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"P"];
        [self terminaJuego];
    }
}

- (IBAction)botonQ:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"Q"];
        [self terminaJuego];
    }
}

- (IBAction)botonR:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"R"];
        [self terminaJuego];
    }
}

- (IBAction)botonS:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"S"];
        [self terminaJuego];
    }
}

- (IBAction)botonT:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"T"];
        [self terminaJuego];
    }
}

- (IBAction)botonU:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"U"];
        [self terminaJuego];
    }
}

- (IBAction)botonV:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"V"];
        [self terminaJuego];
    }
}

- (IBAction)botonW:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"W"];
        [self terminaJuego];
    }
}

- (IBAction)botonX:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"X"];
        [self terminaJuego];
    }
}

- (IBAction)botonY:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"Y"];
        [self terminaJuego];
    }
}

- (IBAction)botonZ:(id)sender {
    if (activo) {
        UIButton *theButton = (UIButton *)sender;
        theButton.enabled = NO;
        [self buscaLetra:@"Z"];
        [self terminaJuego];
    }
}

- (IBAction)regresarButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)siguienteButton:(id)sender {  //boton que sirve para ir a la siguiente frase

    x++;
    [self preparaVista:x];

}

- (IBAction)postFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        self.erroresLabel.hidden = YES;
        self.puntosLabel.hidden = YES;
        self.regresarButton.hidden = YES;
        self.facebookButton.hidden = YES;
        self.twitterButton.hidden = YES;
        
        CGRect rect = [self.view bounds];
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.view.layer renderInContext:context];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.erroresLabel.hidden = NO;
        self.puntosLabel.hidden = NO;
        self.regresarButton.hidden = NO;
        self.facebookButton.hidden = NO;
        self.twitterButton.hidden = NO;
        
        //set the initial text message
        [fbComposer setInitialText:@"¿Cúal es la frase?"];
        [fbComposer addImage: image];
        
        //present the composer to the user
        [self presentViewController:fbComposer animated:YES completion:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up facebook service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
        
    }
}

- (IBAction)postTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetController = [SLComposeViewController
                                                    composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        self.erroresLabel.hidden = YES;
        self.puntosLabel.hidden = YES;
        self.regresarButton.hidden = YES;
        self.facebookButton.hidden = YES;
        self.twitterButton.hidden = YES;
        
        CGRect rect = [self.view bounds];
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.view.layer renderInContext:context];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.erroresLabel.hidden = NO;
        self.puntosLabel.hidden = NO;
        self.regresarButton.hidden = NO;
        self.facebookButton.hidden = NO;
        self.twitterButton.hidden = NO;
        
        //set the initial text message
        [tweetController setInitialText:@"¿Cúal es la frase?"];
        [tweetController addImage:image];
        
        //present the controller to the user
        [self presentViewController:tweetController animated:YES completion:nil];
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"twitter Error"
                                  message:@"You may not have set up twitter service on your device or\n                                  You may not connected to internent.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
        
    }
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"inicio"]) {
    }
    
    if ([[segue identifier] isEqualToString:@"guardar"]) {
        
        [[segue destinationViewController] setDetailItem:datosPartida];
        
    }
}
@end
