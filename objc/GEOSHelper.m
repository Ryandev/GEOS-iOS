/**
 @file ShapeKit
 @author Michael Weisman
 @editor Ryan Powell
 @license GNU Lesser General Public Licence
 */


#import "GEOSHelper.h"


@interface GEOSHelper ()
{
@private
    GEOSContextHandle_t _handle;
}
@end

@implementation GEOSHelper

@synthesize handle = _handle;

#pragma mark GEOS logging

-(id) init
{
    if (( [super init] ))
    {
        _handle = initGEOS_r(_geosLogInfo, _geosLogError);
        assert(_handle);
    }

    return self;
}

-(void) dealloc
{
    finishGEOS_r(_handle);
}

+(instancetype) sharedInstance
{
    static dispatch_once_t once = 0;
    static id instance = nil;
    
    dispatch_once(&once, ^
    {
        instance = [[self alloc] init];
    });
    
    return instance;
}

-(GEOSGeometry*) geometryWithWKB:(NSData*)wkbData
{
    GEOSGeometry *geom = nil;
    
    GEOSWKBReader *WKBReader = GEOSWKBReader_create_r(_handle);
    
    if ( WKBReader )
    {
        geom = GEOSWKBReader_read_r(_handle, WKBReader, wkbData.bytes, wkbData.length);
        
        GEOSWKBReader_destroy_r(_handle, WKBReader);
    }
    
    return geom;
}

-(GEOSGeometry*) geometryWithWKT:(NSString*)wkt
{
    GEOSGeometry *geom = nil;
    
    GEOSWKTReader *WKTReader = GEOSWKTReader_create_r(_handle);
    
    if ( WKTReader )
    {
        geom = GEOSWKTReader_read_r(_handle, WKTReader, wkt.UTF8String);
        
        GEOSWKTReader_destroy_r(_handle, WKTReader);
    }
    
    return geom;
}


#pragma mark - private


void _geosLogInfo(const char *fmt,...)
{
#ifdef DEBUG
    va_list ap;
    
    fprintf( stdout, "GEOS(DEBUG): ");
    
    va_start(ap, fmt);
    vfprintf(stdout, fmt, ap);
    va_end(ap);

    fprintf(stdout, "\n" );
#endif
}

void _geosLogError(const char *fmt,...)
{
    va_list ap;
    
    fprintf(stdout, "GEOS(ERR): ");
    
    va_start(ap, fmt);
    vfprintf(stdout, fmt, ap);
    va_end(ap);

    fprintf(stdout, "\n" );
}

@end
