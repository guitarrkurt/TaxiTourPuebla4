//
//  ViewController.m
//  Taxi Tour Puebla
//
//  Created by guitarrkurt on 29/08/14.
//  Copyright (c) 2014 BUAP. All rights reserved.
//

#import "ViewController.h"
#import "SanPedroViewController.h"
#import "ElCantoRuisenorViewController.h"
#import "BlueBarViewController.h"
#import "MuseoBelloViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setUpView]; //Cargamos las vistas
    [[self SegundaPulsacion] setHidden:YES];//Ocultamos la segunda pulsación
    contadorPrimeraPulsacion = contadorSegundaPulsacion = 0;//Inicializamos las variables
    [[self ApiGoogleMaps] setHidden:YES];//OCultamos iconos
    [[self ShowTableView] setHidden:YES];
    
    [[self scrollVIew] setHidden:YES];//Ocultamos el scroll view
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)setUpView{
    view1 = [[UIView alloc]initWithFrame:self.view.frame];
    view1.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Portada.png"]];
    
    view2 = [[UIView alloc]initWithFrame:self.view.frame];
    //view2.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"Eleccion.jpg"]];
    view2.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
}

-(void)doTransitionWithType:(UIViewAnimationTransition)animationTransitionType{
    if ([[self.view subviews] containsObject:view2 ]) {
        [UIView transitionFromView:view2
                            toView:view1
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view2 removeFromSuperview];
                        }];
        [self.view addSubview:view1];
        [self.view sendSubviewToBack:view1];
    }
    else{
        
        [UIView transitionFromView:view1
                            toView:view2
                          duration:2
                           options:animationTransitionType
                        completion:^(BOOL finished){
                            [view1 removeFromSuperview];
                        }];
        [self.view addSubview:view2];
        [self.view sendSubviewToBack:view2];
        
    }
}
- (IBAction)ActionPrimeraPulsacion:(id)sender {
    
    
    contadorPrimeraPulsacion++;
    
    if(contadorPrimeraPulsacion == 1){
        //Cargamos la imagen del taxi
        [self.TaxiImage setImage:[UIImage imageNamed:@"Taxi.png"]];
        [self.TaxiImage setAlpha:0.9];
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2.8];
        
        CGPoint center2 = [self.TaxiImage center];
        center2.x += 800;
        
        [self.TaxiImage setCenter:center2];
        
        //End Animation
        [UIView commitAnimations];
        
        
        //Mostramos el boton
        [self.SegundaPulsacion setHidden:NO];
        [self.PrimeraPulsacion setHidden:YES];
        
    }
}

//Segunda pulsación
-(IBAction)curlUp:(id)sender{
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlUp];
    
    contadorSegundaPulsacion++;
    
    if(contadorSegundaPulsacion == 1){
        
        [self.TaxiImage setHidden:YES];
        [self.SegundaPulsacion setHidden:YES];
        [self.PrimeraPulsacion setHidden:YES];
        
        //Mostramos los botones uno y dos
        [self.ApiGoogleMaps setHidden:NO];
        [self.ShowTableView setHidden:NO];
        
    }
}

- (IBAction)PrimeraPulsacion:(id)sender {
    
    
    contadorPrimeraPulsacion++;
    
    if(contadorPrimeraPulsacion == 1){
        //Cargamos la imagen del taxi
        [self.TaxiImage setImage:[UIImage imageNamed:@"Taxi.png"]];
        [self.TaxiImage setAlpha:0.9];
        
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:2.8];
        
        CGPoint center2 = [self.TaxiImage center];
        center2.x += 800;
        
        [self.TaxiImage setCenter:center2];
        
        //End Animation
        [UIView commitAnimations];
        
        
        //Mostramos el boton
        [self.SegundaPulsacion setHidden:NO];
        [self.PrimeraPulsacion setHidden:YES];
        
    }

}

- (IBAction)SegundaPulsacion:(id)sender {
    
    [self doTransitionWithType:UIViewAnimationOptionTransitionCurlUp];
    
    contadorSegundaPulsacion++;
    
    if(contadorSegundaPulsacion == 1){
        
        [self.TaxiImage setHidden:YES];
        [self.SegundaPulsacion setHidden:YES];
        [self.PrimeraPulsacion setHidden:YES];
        
        //Mostramos los botones uno y dos
        [self.ApiGoogleMaps setHidden:NO];
        [self.ShowTableView setHidden:NO];
        [self.scrollVIew setHidden:NO];
        
        //Cargamos las imagenes a nuestro scrollView
        [self setUpScrollView];
        
    }
}


-(void)setUpScrollView{
    
    CGSize sizeScrollView = CGSizeMake(3 * self.scrollVIew.bounds.size.width, self.scrollVIew.bounds.size.height);
    
    [self.scrollVIew setContentSize:sizeScrollView];
    [self.scrollVIew setPagingEnabled:YES];
    
    
    //Canto Ruisenor
    CGRect aFrame = self.scrollVIew.bounds;
    UIView *aView = [[UIView alloc] initWithFrame:aFrame];
    
    //
    [aView setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ElEncantoRuisenor.jpg"]]];
    [self.scrollVIew addSubview:aView];
    
    UIButton *boton1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    boton1.frame = aFrame;
    boton1.tag = 1;
    [boton1 setTitle:[NSString stringWithFormat:@"%d", boton1.tag] forState:UIControlStateNormal];
    boton1.titleLabel.font = [UIFont systemFontOfSize:60];
    [boton1 addTarget:self action:@selector(ElEncantoRuisenor:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollVIew addSubview:boton1];
    
    //San Pedro
    aFrame = CGRectOffset(aFrame, self.scrollVIew.bounds.size.width/2, 0);
    aView = [[UIView alloc] initWithFrame:aFrame];
    [aView setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"PosadaSanPedro.jpg"]]];
    [self.scrollVIew addSubview:aView];
    
    UIButton *boton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    boton2.frame = aFrame;
    boton2.tag = 2;
    [boton2 setTitle:[NSString stringWithFormat:@"%d", boton2.tag] forState:UIControlStateNormal];
    boton2.titleLabel.font = [UIFont systemFontOfSize:60];
    [boton2 addTarget:self action:@selector(touchEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollVIew addSubview:boton2];
    
    //Blue Bar
    aFrame = CGRectOffset(aFrame, self.scrollVIew.bounds.size.width/2, 0);
    aView = [[UIView alloc] initWithFrame:aFrame];
    [aView setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"BlueBar.jpg"]]];
    [self.scrollVIew addSubview:aView];
    
    UIButton *boton3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    boton3.frame = aFrame;
    boton3.tag = 3;
    [boton3 setTitle:[NSString stringWithFormat:@"%d", boton3.tag] forState:UIControlStateNormal];
    boton3.titleLabel.font = [UIFont systemFontOfSize:60];
    [boton3 addTarget:self action:@selector(blueBar:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollVIew addSubview:boton3];
    
    //Museo Bello
    aFrame = CGRectOffset(aFrame, self.scrollVIew.bounds.size.width/2, 0);
    aView = [[UIView alloc] initWithFrame:aFrame];
    [aView setBackgroundColor:[[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"MuseoBelloGrande.jpg"]]];
    [self.scrollVIew addSubview:aView];
    
    UIButton *boton4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    boton4.frame = aFrame;
    boton4.tag = 4;
    [boton4 setTitle:[NSString stringWithFormat:@"%d", boton4.tag] forState:UIControlStateNormal];
    boton4.titleLabel.font = [UIFont systemFontOfSize:60];
    [boton4 addTarget:self action:@selector(museoBello:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollVIew addSubview:boton4];
    
    
    
    
}
-(void)touchEvent:(id)sender{
    SanPedroViewController *spvc = [[SanPedroViewController alloc] initWithNibName:@"SanPedroViewController" bundle:nil];
    [self.navigationController presentModalViewController:spvc animated:YES];
    

}
-(void)ElEncantoRuisenor:(id)sender{
    ElCantoRuisenorViewController *crvc = [[ElCantoRuisenorViewController alloc] initWithNibName:@"ElCantoRuisenorViewController" bundle:nil];
    [self.navigationController presentModalViewController:crvc animated:YES];
}
-(void)blueBar:(id)sender{
    BlueBarViewController *bbvc = [[BlueBarViewController alloc] initWithNibName:@"BlueBarViewController" bundle:nil];
    [self.navigationController presentModalViewController:bbvc animated:YES];
}
-(void)museoBello:(id)sender{
    MuseoBelloViewController *mbvc = [[MuseoBelloViewController alloc] initWithNibName:@"MuseoBelloViewController" bundle:nil];
    [self.navigationController presentModalViewController:mbvc animated:YES];

}
@end
