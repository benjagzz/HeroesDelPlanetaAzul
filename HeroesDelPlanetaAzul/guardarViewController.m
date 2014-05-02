//
//  guardarViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "guardarViewController.h"
#import <Social/Social.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface guardarViewController (){
    NSMutableArray *listaPartidas;
    NSMutableArray *listaEscudos;  //contiene las frases obtenidas del CoreData
    AVAudioPlayer *audioPlayer;
}

-(void) cargarEscudo;

@end

@implementation guardarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)setdetailItem:(id)newObjectMostrar
{
    if (_detailItem != newObjectMostrar) {
        _detailItem = newObjectMostrar;
    }
}

-(void)dismissKeyboard {            //esconder el teclado
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    if (!listaEscudos) {
        listaEscudos= [[NSMutableArray alloc] init];
    }
    
    BDmanejo *servicios = [BDmanejo instancia];

    [servicios cargarEscudos];
    
    listaEscudos = servicios.listaEscudos;
    
    [self cargarEscudo];
    
    self.puntosLabel.text = [NSString stringWithFormat:@"%@",[self.detailItem valueForKey:@"puntos"]];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];

}

-(void) cargarEscudo{
    
    NSNumber  *punt = [NSNumber numberWithInteger: [[self.detailItem valueForKey:@"puntos"] intValue]];
    
    if ([punt integerValue] <= 715){
        NSString *nombreFoto = [NSString stringWithFormat:@"escudoBronce.png"];
        self.escudoImageView.image = [UIImage imageNamed:nombreFoto];
    }
    else if ([punt integerValue] <= 1430 && [punt integerValue] >= 716){
        NSString *nombreFoto = [NSString stringWithFormat:@"escudoPlata.png"];
        self.escudoImageView.image = [UIImage imageNamed:nombreFoto];
    }
    else if ([punt integerValue] >= 1431){
        NSString *nombreFoto = [NSString stringWithFormat:@"escudoOro.png"];
        self.escudoImageView.image = [UIImage imageNamed:nombreFoto];
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

- (IBAction)guardarButton:(id)sender {
    
    [audioPlayer play];
    
    if([self.nombreTF.text isEqualToString:@""]){
        UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle:@"ERROR"
                              message:@"Ingresa un nombre"
                              delegate:self
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [error show];
        
    }
    else{
    
    NSDictionary *partidaEntidad = [[NSDictionary alloc] initWithObjectsAndKeys: [self.detailItem valueForKey:@"puntos"], @"puntos",self.nombreTF.text, @"nombre", nil];
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios insertarPartida:partidaEntidad];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
}
- (IBAction)postFacebook:(id)sender {
    
    [audioPlayer play];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController *fbComposer = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];

 /*
        CGRect rect = [self.view bounds];
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.view.layer renderInContext:context];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
*/
        
        //set the initial text message
        NSString *texto = [NSString stringWithFormat:@"He obtenido %@ puntos. !Intenta vencerme!", [self.detailItem valueForKey:@"puntos"]];
        UIImage *image = self.escudoImageView.image;
        [fbComposer setInitialText:texto];
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
    
    [audioPlayer play];
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetController = [SLComposeViewController
                                                    composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        
        /*
        CGRect rect = [self.view bounds];
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.view.layer renderInContext:context];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
         */
        
        //set the initial text message
        NSString *texto = [NSString stringWithFormat:@"He obtenido %@ puntos. !Intenta vencerme!", [self.detailItem valueForKey:@"puntos"]];
        UIImage *image = self.escudoImageView.image;
        [tweetController setInitialText:texto];
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
@end
