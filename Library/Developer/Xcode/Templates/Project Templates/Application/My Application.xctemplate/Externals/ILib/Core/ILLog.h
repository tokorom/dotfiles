//
//  ILLog.h
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

#ifdef DEBUG

#undef NSLog
#define NSLog(fmt, ...) NSLog(fmt, ##__VA_ARGS__)

#else

#undef NSLog
#define NSLog(args...)

#endif
