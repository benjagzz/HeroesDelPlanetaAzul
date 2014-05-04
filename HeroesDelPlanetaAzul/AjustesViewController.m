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
    NSString *sonidoA;
}

@end

@implementation AjustesViewController

- (void)setMusicaFondo:(id)newmusicaFondo
{
    if (_musicaFondo != newmusicaFondo) {
        _musicaFondo = newmusicaFondo;
        
        [self viewDidLoad];
    }
}

-(void)setSonido:(id)newsonido
{
    if (_sonido != newsonido) {
        _sonido = newsonido;
        sonidoA = _sonido;
        
        [self viewDidLoad];
    }
    
}

- (void) sonidoBoton
{
    if ([sonidoA isEqualToString:@"on"]) {
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"click" ofType:@"mp3"];
    
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];

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
    
    
     if(self.sonidoOutlet.on){
         sonidoA = @"on";
         NSLog(@"true");
    }
    else {
        sonidoA = @"off";
        NSLog(@"false");
    }
    
}

- (IBAction)musicaSwitch:(id)sender {
    
    if(self.musicaOutlet.on){
            [_musicaFondo setVolume:1];
    }
    else {
            [_musicaFondo setVolume:0];
    }
    
}
@end
