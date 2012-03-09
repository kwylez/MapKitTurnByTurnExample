//
//  RootViewController.m
//  Maps
//
//  Created by cwiles on 3/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "RootViewController.h"
#import "Annotation.h"

@implementation RootViewController

@synthesize mapView         = _mapView;
@synthesize locationManager = _locationManager;
@synthesize mapAnnotation   = _mapAnnotation;
@synthesize _lat;
@synthesize _long;

- (void)dealloc {
  [_mapView release];
  [_mapAnnotation release];
  _locationManager.delegate = nil;
  [_locationManager release];
  [_lat release];
  [_long release];
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)setCurrentLocation:(CLLocation *)location {
  
  MKCoordinateRegion region = {{0.0f, 0.0f}, {0.0f, 0.0f}};
  
  region.center = location.coordinate;
  
  region.span.longitudeDelta = 0.05f;
  region.span.latitudeDelta  = 0.05f;
  
  [self.mapView setRegion:region animated:YES];
  [self.mapView regionThatFits:region];
}

- (void)viewDidAppear:(BOOL)animated {
  
  [super viewDidAppear:animated];
  
  self.locationManager = [[[CLLocationManager alloc] init] autorelease];
  
  self.locationManager.delegate        = self;
  self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;

  [self.locationManager startUpdatingLocation];

  CLLocationDegrees latitude  = kPOILat;
  CLLocationDegrees longitude = kPOILong;

  CLLocation* currentLocation = [[[CLLocation alloc] initWithLatitude:latitude longitude:longitude] autorelease];
    
  self.mapAnnotation = [Annotation annotationWithCoordinate:currentLocation.coordinate];
  self.mapAnnotation.title    = @"Sekisui Pacific Rim";
  self.mapAnnotation.subtitle = @"Cory's Favorite Sushi Place in Memphis";
  
  if (nil != self.mapAnnotation) {
    
    [self.mapView addAnnotation:self.mapAnnotation];
    
    self.mapAnnotation = nil;
  }
  
  [self setCurrentLocation:currentLocation];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {

  self.mapView         = nil;
  self.mapAnnotation   = nil;
  self.locationManager = nil;
}

#pragma mark MapView delegate/datasourec methods
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
  
  MKPinAnnotationView *view = nil; // return nil for the current user location
  
  if (annotation != mapView.userLocation) {
    
    view = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"identifier"];
    
    if (nil == view) {
      view = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"identifier"] autorelease];
      view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    }
    
    [view setPinColor:MKPinAnnotationColorPurple];
    [view setCanShowCallout:YES];
    [view setAnimatesDrop:YES];

  } else {
    
    CLLocation *location = [[CLLocation alloc] initWithLatitude:mapView.userLocation.coordinate.latitude 
                                                      longitude:mapView.userLocation.coordinate.longitude];
    [self setCurrentLocation:location];
  }
  return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  
  GMapDirectionsViewController *gmd = [[GMapDirectionsViewController alloc] initWithNibName:@"GMapDirectionsView" bundle:nil];

  gmd.latitude  = self._lat;
  gmd.longitude = self._long;

  [self.navigationController pushViewController:gmd animated:YES];
  
  [gmd release];
}

#pragma mark -
#pragma mark CoreLocation Delegate Methods
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {

  NSLog(@"lat/long: %f. %f", [newLocation coordinate].latitude, [newLocation coordinate].longitude);
  
  CLLocationDegrees latitude = newLocation.coordinate.latitude;
  CLLocationDegrees longitude = newLocation.coordinate.longitude;
  
  self._lat  = [[NSNumber numberWithDouble:latitude] stringValue];
  self._long = [[NSNumber numberWithDouble:longitude] stringValue];
  [self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  [self.locationManager stopUpdatingLocation];
	NSLog(@"Error: %@", [error description]);
}


@end

