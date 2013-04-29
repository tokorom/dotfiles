//
//  ILNib.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#import "ILNib.h"
#import "ILibUtil.h"

@implementation ILNib

#pragma mark - Public Interface

+ (UINib*)nibForClass:(Class)class
{
  return [ILNib nibForClassName:NSStringFromClass(class)];
}

+ (UINib*)nibForClassName:(NSString*)className
{
  UINib* nib;
  NSString* nibName = isPad ? [className stringByAppendingString:@"~iPad"] : className;
  NSString* path = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
  if ( 0 != path.length) {
    nib = [UINib nibWithNibName:nibName bundle:nil];
  } else {
    nib = [UINib nibWithNibName:className bundle:nil];
  }
  return nib;
}
  
+ (id)instantiateWithOwner:(id)ownerOrNil forClass:(Class)class
{
  return [ILNib instantiateWithOwner:ownerOrNil forClassName:NSStringFromClass(class)];
}

+ (id)instantiateWithOwner:(id)ownerOrNil forClassName:(NSString*)className
{
  NSArray* instances = [[ILNib nibForClassName:className] instantiateWithOwner:ownerOrNil options:nil];
  return (0 < instances.count) ? instances[0] : nil;
}

@end
