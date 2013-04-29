//
//  NSNull+IgnoreMessages.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#import "NSNull+IgnoreMessages.h"

@implementation NSNull (IgnoreMessages)

- (void)forwardInvocation:(NSInvocation*)anInvocation
{
  if ([self respondsToSelector:[anInvocation selector]]) {
    [anInvocation invokeWithTarget:self];
  }
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)aSelector
{
  NSMethodSignature* sig = [[NSNull class] instanceMethodSignatureForSelector:aSelector];
  // Just return some meaningless signature
  if (!sig) {
    sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
  }
  return sig;
}

@end
