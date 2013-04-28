//
//  ILSingleton.h
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#define INTERFACE_FOR_SINGLETON(cls) \
+ (cls*)sharedInstance; \

#define IMPLEMENTATION_FOR_SINGLETON(cls) \
static cls* sharedInstance = nil; \
\
+ (cls*)sharedInstance { \
@synchronized( self ) { \
if ( nil == sharedInstance ) { \
[self new]; \
}  \
} \
return sharedInstance; \
} \
\
+ (id)allocWithZone:(NSZone*)zone { \
@synchronized( self ) { \
if ( nil == sharedInstance ) { \
sharedInstance = [super allocWithZone:zone]; \
return sharedInstance; \
}  \
} \
return nil; \
} \
\
- (id)copyWithZone:(NSZone*)zone { \
return self; \
} \
