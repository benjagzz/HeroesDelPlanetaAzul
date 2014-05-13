//
//  VideoViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 09/05/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "VideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoViewController (){
    NSMutableArray *videos;
    AVAudioPlayer *audioPlayer;
    NSString *boolSonido;
    NSString *boolMusica;
}
//función para reproducir el Video
- (void)reproduceVideo;

@end

@implementation VideoViewController

//obtiene el delegado mandado por el JuegoViewController
- (void)setMusicaFondo:(id)newmusicaFondo
{
    if (_musicaFondo != newmusicaFondo) {
        _musicaFondo = newmusicaFondo;
        
        [self viewDidLoad];
    }
}

//sonido para el boton
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
    Sonidos *servicios = [Sonidos sharedManager];
    boolMusica = [servicios mandarMusica];
    if([boolMusica isEqualToString:@"on"]){
        [_musicaFondo setVolume:0];
    }
    videos = [[NSMutableArray alloc] initWithObjects:@"Gq5Hvt3c0RY", @"VTfS_oHUHVs", @"TV5kTY--Yqk", @"1kFBrT3KZRE", @"tBAP_fqqbiE", @"PvijM0aUg8I", @"G5l5GCZ7pK8", @"BIGOx9I0zgw", @"NJQfZXwMSr8", @"O5V2Yr2AcJA", @"heumh_OKCOI", @"V2wccR9-PSc", @"kctBSJUBNBs", @"WEmlyG9iW0I", @"5jzaDj2pcWU", @"xTrRWsd5ns8", @"gqUJk26JxqY",nil];
    
    [self reproduceVideo];
}

//función para reproducir los videos
- (void)reproduceVideo{
    
    int i = rand()%(videos.count-1)+0;
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(20, 124, 728, 500)];
    [self.webView setAllowsInlineMediaPlayback:YES];
    [self.webView setMediaPlaybackRequiresUserAction:NO];
    [self.view addSubview:self.webView];
    NSString* embedHTML = [NSString stringWithFormat:@"\
                           <html>\
                           <body style='margin:0px;padding:0px;'>\
                           <script type='text/javascript' src='http://www.youtube.com/iframe_api'></script>\
                           <script type='text/javascript'>\
                           function onYouTubeIframeAPIReady()\
                           {\
                           ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})\
                           }\
                           function onPlayerReady(a)\
                           { \
                           a.target.playVideo(); \
                           }\
                           </script>\
                           <iframe id='playerId' type='text/html' width='%d' height='%d' src='http://www.youtube.com/embed/%@?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'>\
                           </body>\
                           </html>", 728, 500, [videos objectAtIndex:i]];
    
    [self.webView loadHTMLString:embedHTML baseURL:[[NSBundle mainBundle] resourceURL]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//regresa al menu inicial
- (IBAction)regresarButton:(id)sender {
    if([boolMusica isEqualToString:@"on"]){
        [_musicaFondo setVolume:1];
    }
    [self.navigationController popViewControllerAnimated:YES];
    [self sonidoBoton];
}
@end
