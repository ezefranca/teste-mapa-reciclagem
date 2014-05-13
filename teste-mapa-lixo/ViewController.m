//
//  ViewController.m
//  teste-mapa-lixo
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 13/05/14.
//  Copyright (c) 2014 EZEQUIEL FRANCA DOS SANTOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self conectar];
	//
    //  Bandejao.m
    //  bandejaoUSP
    //
    //  Created by Ezequiel Franca dos Santos on 02/05/14.
    //  Copyright (c) 2014 Ezequiel Franca dos Santos. All rights reserved.
    //
}

    
-(void)conectar{
        NSLog(@"Inicializando...");
        //NSString *url = [NSString stringWithFormat:@"http://api-bitcluster.rhcloud.com/bandejao/get?restaurants=%@",bandejao];
        NSString *url = [NSString stringWithFormat:@"http://172.246.16.27/retornaPontos.php"];
        jsonDados = [[NSData alloc] initWithContentsOfURL:
                     [NSURL URLWithString:url]];
        [self parseDados];
}
    
-(void)parseDados{
        
        NSError *error;
        
        NSMutableDictionary *jsonDadosUsuario = [NSJSONSerialization
                                                 JSONObjectWithData:jsonDados
                                                 options:NSJSONReadingMutableContainers
                                                 error:&error];
    
    //NSLog(@"%@", jsonDadosUsuario);
    NSMutableArray *arraydaora;
    arraydaora = [[NSMutableArray alloc] init];
    arraydaora = (NSMutableArray *)jsonDadosUsuario;
    NSLog(@"%@", [arraydaora[1]objectForKey:@"latitude"]);
    NSLog(@"%@", [arraydaora[1]objectForKey:@"longitude"]);
    
    
    for (id local in arraydaora) {
        
        MKPointAnnotation *ponto = [[MKPointAnnotation alloc]init   ];
        ponto.coordinate = CLLocationCoordinate2DMake([[local objectForKey:@"latitude"] doubleValue], [[local objectForKey:@"longitude"] doubleValue]);
        
        
        ponto.title = [local objectForKey:@"nome"];
        
      
        
        [self.mapa addAnnotation:ponto];
    }
    
    
   
    //float x = [arraydaora objectAtIndex:0];
    
}
    - (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    if([annotation isKindOfClass:[PontosBandejao class]]) {
//        
//        PontosBandejao *ponto = (PontosBandejao *)annotation;
//        MKAnnotationView *anotacao = [self.map dequeueReusableAnnotationViewWithIdentifier:@"PontosBandejao"];
//        
//        if(anotacao == nil) {
//            anotacao = ponto.pontoDeBandejaoView;
//        }else{
//            anotacao.annotation = annotation;
//        }
//        
//        return anotacao;
//    }
//    return nil;
//}

@end
