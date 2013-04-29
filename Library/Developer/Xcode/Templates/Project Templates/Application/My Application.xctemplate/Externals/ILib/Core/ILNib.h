//
//  ILNib.h
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

@interface ILNib : NSObject

+ (UINib*)nibForClass:(Class)class;
+ (UINib*)nibForClassName:(NSString*)className;
+ (id)instantiateWithOwner:(id)ownerOrNil forClass:(Class)class;
+ (id)instantiateWithOwner:(id)ownerOrNil forClassName:(NSString*)className;

@end
