//
//  creditosViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 01/05/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "creditosViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface creditosViewController (){
    AVAudioPlayer *audioPlayer;
    NSString *boolSonido;
}

@end

@implementation creditosViewController

//obtiene el sonido del boton
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//regresar al menu inicial
- (IBAction)regresarButton:(id)sender {
    
    [self sonidoBoton];
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
