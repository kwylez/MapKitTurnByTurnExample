//
//  RootViewController.h
//  Maps
//
//  Created by cwiles on 3/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "RootViewController.h"
#import "GMapDirectionsViewController.h"
#import <CoreLocation/CoreLocation.h>

#define kPOILat 35.115403
#define kPOILong -89.9045614724

@class Annotation;

@interface RootViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate, CLLocationManagerDelegate> {

  MKMapView *_mapView;
  Annotation *_newAnnotation;
  CLLocationManager *_locationManager;
  NSString *_lat;
  NSString *_long;
}

@property(nonatomic, retain) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) Annotation *newAnnotation;
@property(nonatomic, retain) CLLocationManager *locationManager;
@property(nonatomic, retain) NSString *_lat;
@property(nonatomic, retain) NSString *_long;

- (void)setCurrentLocation:(CLLocation *)location;

@end
