//
//  ViewController.h
//  teste-mapa-lixo
//
//  Created by EZEQUIEL FRANCA DOS SANTOS on 13/05/14.
//  Copyright (c) 2014 EZEQUIEL FRANCA DOS SANTOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>{
    NSData *jsonDados;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapa;

@end
