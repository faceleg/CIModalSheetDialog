//
//  SModalSheetDialogs.h
//  SliderRewrite
//
//  Created by Michael Robinson on 7/08/11.
//  Copyright 2011 Code of Interest. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIModalSheetDialog : NSObject

+ (void) showModalMessage:(NSString *)message withInformativeText:(NSString *)informativeText 
                withStyle:(NSAlertStyle)style fromSender:(id)sender;

+ (void) showModalRequest:(NSString *)message withInformativeText:(NSString *)informativeText 
                withStyle:(NSAlertStyle)style andButtons:(NSArray *)buttons 
           andContextInfo:(void *)contextInfo fromSender:(id)sender;

@end
