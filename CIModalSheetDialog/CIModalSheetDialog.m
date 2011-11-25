//
//  SModalSheetDialogs.m
//  SliderRewrite
//
//  Created by Michael Robinson on 7/08/11.
//  Copyright 2011 Code of Interest. All rights reserved.
//

#import "CIModalSheetDialog.h"

@implementation CIModalSheetDialog

+ (void) showModalMessage:(NSString *)message withInformativeText:(NSString *)informativeText 
                withStyle:(NSAlertStyle)style fromSender:(id)sender {
                    
    NSAlert *alert = [[[NSAlert alloc] init] autorelease];
    
    [alert addButtonWithTitle:@"OK"];

    [alert setInformativeText:informativeText];
    [alert setMessageText:message];
    
    [alert setAlertStyle:style];
    
    [alert beginSheetModalForWindow:[NSApp mainWindow] 
                      modalDelegate:sender 
                     didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) 
                        contextInfo:nil];
}

+ (void) showModalRequest:(NSString *)message withInformativeText:(NSString *)informativeText 
                withStyle:(NSAlertStyle)style andButtons:(NSArray *)buttons 
           andContextInfo:(void *)contextInfo fromSender:(id)sender {

    NSAlert *alert = [[[NSAlert alloc] init] autorelease];

    NSEnumerator *e = [buttons objectEnumerator];
    id object;
    while (object = [e nextObject]) {
        [alert addButtonWithTitle:(NSString*)object];
    }

    [alert setInformativeText:informativeText];
    [alert setMessageText:message];
    
    [alert setAlertStyle:style];

    [alert beginSheetModalForWindow:[NSApp mainWindow] 
                      modalDelegate:sender 
                     didEndSelector:@selector(alertDidEnd:returnCode:contextInfo:) 
                        contextInfo:contextInfo];
    
}

@end
