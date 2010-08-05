//
//  GMapDirections.h
//  Maps
//
//  Created by Cory Wiles on 3/20/10.
//  Copyright 2010 Wiles, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GMapDirectionsViewController : UIViewController <UIWebViewDelegate> {
  
  IBOutlet UIWebView *webView;
  
  NSString *latitude;
  NSString *longitude;
  
  UIActivityIndicatorView *activeIndicator;
  
  IBOutlet UIToolbar *toolBar;
  IBOutlet UIBarButtonItem *mapsButton;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activeIndicator;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;
@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *mapsButton;

- (IBAction)openGoogleMapsApp:(id)sender;

@end
