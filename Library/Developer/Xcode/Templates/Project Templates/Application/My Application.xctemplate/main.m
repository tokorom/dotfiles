//
//  main.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#import "AppDelegate.h"

int main(int argc, char *argv[])
{
  int retVal;
  @autoreleasepool {
#ifdef DEBUG
    @try {
#endif
      retVal = UIApplicationMain(argc, argv, NULL, NSStringFromClass([AppDelegate class]));
#ifdef DEBUG
    }
    @catch (NSException *exception) {
      NSLog(@"Exception: %@", exception);
      NSLog(@"%@", [exception callStackSymbols]);
      @throw exception;
    }
#endif
  }
  return retVal;
}
