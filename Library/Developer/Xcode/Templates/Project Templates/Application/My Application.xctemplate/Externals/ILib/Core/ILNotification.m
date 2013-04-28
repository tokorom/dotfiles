//
//  ILNotification.m
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#import "ILNotification.h"

@implementation ILNotification

#pragma mark - Public Interface

+ (void)addObserver:(id)observer selector:(SEL)selector name:(NSString*)name
{
  [[NSNotificationCenter defaultCenter] addObserver:observer selector:selector name:name object:nil];
}

+ (void)removeObserver:(id)observer
{
  [[NSNotificationCenter defaultCenter] removeObserver:observer];
}

+ (void)removeObserver:(id)observer name:(NSString*)name
{
  [[NSNotificationCenter defaultCenter] removeObserver:observer name:name object:nil];
}

+ (void)postNotification:(NSString*)name
{
  [ILNotification postNotification:name object:nil];
}

+ (void)postNotification:(NSString*)name object:(id)object
{
  [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
}

+ (void)postNotification:(NSString*)name object:(id)object userInfo:(NSDictionary*)userInfo
{
  [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo];
}

@end
