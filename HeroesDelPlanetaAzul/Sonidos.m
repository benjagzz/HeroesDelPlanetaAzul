//
//  Sonidos.m
//  HeroesDelPlanetaAzul
//
//  Created by Benjamin Gonzalez on 5/9/14.
//  Copyright (c) 2014 AriFlores. All rights reserved.
//

#import "Sonidos.h"

@implementation Sonidos{
    NSString *boolSonido;
    NSString *boolMusica;
}
@synthesize prueba;

#pragma mark Singleton Methods

+ (id)sharedManager {
    static Sonidos *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        prueba = @"Default Property Value";
    }
    return self;
}

-(void)buscarSonido:(NSString *) buscar{
    if ([buscar isEqualToString:@"on"]) {
        boolSonido = @"on";
    }
    else
        boolSonido = @"off";
};

-(NSString *)mandarSonido{
    return boolSonido;
}

-(void)buscarMusica:(NSString *) buscar{
    if ([buscar isEqualToString:@"on"]) {
        boolMusica = @"on";
    }
    else
        boolMusica = @"off";
};

-(NSString *)mandarMusica{
    return boolMusica;
}
@end
