//
//  guardarViewController.m
//  HeroesDelPlanetaAzul
//
//  Created by Ari Flores on 26/03/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "guardarViewController.h"

@interface guardarViewController (){
    NSMutableArray *listaPartidas;
}

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
    
    
    self.puntosLabel.text = [NSString stringWithFormat:@"%@",[self.detailItem valueForKey:@"puntos"]];
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
    
    NSDictionary *partidaEntidad = [[NSDictionary alloc] initWithObjectsAndKeys: [self.detailItem valueForKey:@"puntos"], @"puntos",self.nombreTF.text, @"nombre", nil];
    
    BDmanejo *servicios = [BDmanejo instancia];
    
    [servicios insertarPartida:partidaEntidad];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
