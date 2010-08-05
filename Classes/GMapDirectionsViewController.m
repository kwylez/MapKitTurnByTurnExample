    //
//  GMapDirections.m
//  Maps
//
//  Created by Cory Wiles on 3/20/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import "GMapDirectionsViewController.h"


@implementation GMapDirectionsViewController

@synthesize webView;
@synthesize latitude;
@synthesize longitude;
@synthesize activeIndicator;
@synthesize toolBar;
@synthesize mapsButton;

- (void)viewDidLoad {
  
  NSLog(@"lat: %@", latitude);
  NSLog(@"long:  %@", longitude);
  
  NSString *url         = [NSString stringWithFormat:@"%@?lat=%@&long=%@", 
                           [[NSBundle mainBundle] pathForResource:@"map" 
                                                           ofType:@"html"], 
                           latitude, 
                           longitude];

  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
  
  webView.delegate = self;
  
  [webView loadRequest:request];
  
  [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  
  [super viewDidUnload];

  webView         = nil;
  activeIndicator = nil;
  toolBar         = nil;
  mapsButton      = nil;
}

- (void)dealloc {

  webView.delegate = nil;
  
  [webView release];
  [latitude release];
  [longitude release];
  [activeIndicator release];
  [toolBar release];
  [mapsButton release];
  
  [super dealloc];
}

#pragma mark -
#pragma mark UIWebViewDelegate Methods
- (void)webViewDidStartLoad:(UIWebView *)webView {

  UIApplication* app = [UIApplication sharedApplication];
  
  app.networkActivityIndicatorVisible = YES;
  
  [self.activeIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
  
  UIApplication* app = [UIApplication sharedApplication];
  
  app.networkActivityIndicatorVisible = NO;
  
  [self.activeIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  
  NSString *errorString = [NSString stringWithFormat:@"@%", error];
  
  if (error != NULL) {
    
    UIAlertView *searchErrorAlert = [[UIAlertView alloc] initWithTitle:@"Error" 
                                                               message:errorString 
                                                              delegate:self 
                                                     cancelButtonTitle:nil 
                                                     otherButtonTitles:@"Dismiss", nil];
    [searchErrorAlert show];
    [searchErrorAlert release];
  }  
}

#pragma mark -
#pragma mark Custom Methods
- (IBAction)openGoogleMapsApp:(id)sender {
  
  NSString *url = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@&mrt=yp",
                   [@"Pacific Rim Memphis, TN" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
  
  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
