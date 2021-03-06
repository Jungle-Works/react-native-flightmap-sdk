//
//  RCTMGLBackgroundLayerManager.m
//  RCTMGL
//
//  Created by Nick Italiano on 9/25/17.
//  Copyright © 2017 Mapbox Inc. All rights reserved.
//

#import "RCTMGLBackgroundLayerManager.h"
#import "RCTMGLBackgroundLayer.h"

@implementation RCTMGLBackgroundLayerManager

RCT_EXPORT_MODULE()

// standard layer props
RCT_EXPORT_VIEW_PROPERTY(id, NSString);
RCT_EXPORT_VIEW_PROPERTY(sourceID, NSString);

RCT_EXPORT_VIEW_PROPERTY(aboveLayerID, NSString);
RCT_EXPORT_VIEW_PROPERTY(belowLayerID, NSString);
RCT_EXPORT_VIEW_PROPERTY(layerIndex, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(reactStyle, NSDictionary);

RCT_EXPORT_VIEW_PROPERTY(maxZoomLevel, NSNumber);
RCT_EXPORT_VIEW_PROPERTY(minZoomLevel, NSNumber);

- (UIView*)view
{
    RCTMGLBackgroundLayer *layer = [[RCTMGLBackgroundLayer alloc] init];
    layer.bridge = self.bridge;
    return layer;
}

@end
