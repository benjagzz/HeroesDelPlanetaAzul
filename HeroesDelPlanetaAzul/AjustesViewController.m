//
//  AjustesViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "AjustesViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface AjustesViewController (){
    AVAudioPlayer *audioPlayer;
    NSString *boolSonido;
    NSString *boolMusica;
}

@end

@implementation AjustesViewController

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

- (void)setMusicaFondo:(id)newmusicaFondo
{
    if (_musicaFondo != newmusicaFondo) {
        _musicaFondo = newmusicaFondo;
        
        [self viewDidLoad];
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
    //Sonidos *servicios = [Sonidos sharedManager];
    Sonidos *servicios = [Sonidos sharedManager];
    boolMusica = [servicios mandarMusica];
    boolSonido = [servicios mandarSonido];
    if([boolMusica isEqualToString:@"on"]){
        [self.musicaOutlet setOn:YES];
    }
    else {
        [self.musicaOutlet setOn:NO];
    }
    if([boolSonido isEqualToString:@"on"]){
        [self.sonidoOutlet setOn:YES];
    }
    else {
        [self.sonidoOutlet setOn:NO];
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
    /*
     if(sonido){
     [audioPlayer play];
     }
     */
    [self sonidoBoton];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)sonidoSwitch:(id)sender {
    Sonidos *servicios = [Sonidos sharedManager];
    if(self.sonidoOutlet.on){
        [servicios buscarSonido:@"on"];
        boolSonido = [servicios mandarSonido];
        [self sonidoBoton];
    }
    else {
        [servicios buscarSonido:@"off"];
        boolSonido = [servicios mandarSonido];
    }
    
}

- (IBAction)musicaSwitch:(id)sender {
    Sonidos *servicios = [Sonidos sharedManager];
    if(self.musicaOutlet.on){
        [servicios buscarMusica:@"on"];
        boolMusica = [servicios mandarMusica];
        [_musicaFondo setVolume:1];
        [self.musicaOutlet setOn:YES];
    }
    else {
        [servicios buscarMusica:@"off"];
        boolMusica = [servicios mandarMusica];
        [_musicaFondo setVolume:0];
        [self.musicaOutlet setOn:NO];
    }
    
}
@end
