//
//  ILGCD.h
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#define MAIN_QUEUE( th ) dispatch_async( dispatch_get_main_queue(), ^{ th } )
#define GLOBAL_QUEUE( th ) dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^{ th } )

typedef void (^Block_b)(void);
typedef void (^GotObject_b)(id);
typedef void (^GotError_b)(NSError*);

typedef void (^Unary_b)(id);
typedef void (^Binary_b)(id, id);
typedef void (^Ternary_b)(id, id, id);
