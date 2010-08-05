//
//  Annotation.m
//  Maps
//
//  Created by cwiles on 3/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Annotation.h"


@implementation Annotation

@synthesize coordinate = _coordinate;
@synthesize title      = _title;
@synthesize subtitle   = _subtitle;

+ (id)annotationWithCoordinate:(CLLocationCoordinate2D)coordinate {
  return [[[[self class] alloc] initWithCoordinate:coordinate] autorelease];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {
  
  self = [super init];
  
  if(nil != self) {
    self.coordinate = coordinate;
  }
  
  return self;
}

@end
