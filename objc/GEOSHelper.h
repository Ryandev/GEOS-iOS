/**
 @file ShapeKit
 @author Michael Weisman
 @editor Ryan Powell
 @license GNU Lesser General Public Licence
 */


#import <Foundation/Foundation.h>
#import <geos/geos_c.h>


@interface GEOSHelper : NSObject

+(instancetype) sharedInstance;

@property (nonatomic, readonly) GEOSContextHandle_t handle;

-(GEOSGeometry*) geometryWithWKT:(NSString*)wkt;
-(GEOSGeometry*) geometryWithWKB:(NSData*)wkb;

@end
