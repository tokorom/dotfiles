//
//  ILNotification.h
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

@interface ILNotification : NSObject

+ (void)addObserver:(id)observer selector:(SEL)selector name:(NSString*)name;
+ (void)removeObserver:(id)observer;
+ (void)removeObserver:(id)observer name:(NSString*)name;
+ (void)postNotification:(NSString*)name;
+ (void)postNotification:(NSString*)name object:(id)object;
+ (void)postNotification:(NSString*)name object:(id)object userInfo:(NSDictionary*)userInfo;

@end
