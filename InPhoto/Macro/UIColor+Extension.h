//
//  UIColor+Extension.h
//  VChat_iOS
//
//  Created by peter on 15/7/31.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)colorWithHex:(UInt32)hex;
+ (UIColor *)colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString withAlpha:(CGFloat)alpha;
- (NSString *)HEXString;

@end
