//
//  CIModalSheetDialogAppDelegate.m
//  CIModalSheetDialog
//
//  Created by Michael Robinson on 24/11/11.
//  Copyright 2011 Code of Interest. All rights reserved.
//

#import "CIModalSheetDialogAppDelegate.h"
#import "CIModalSheetDialog.h"

// Some constants used as keys / identifiers
#define message @"message"
#define information @"information"
#define context_modalWithOptions @"modalWithOptions"

@implementation CIModalSheetDialogAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification { }


- (void) handleTimer: (NSTimer *) timer {
    [CIModalSheetDialog showModalMessage:[[timer userInfo] objectForKey:message]
                     withInformativeText:[[timer userInfo] objectForKey:information]
                               withStyle:NSInformationalAlertStyle 
                              fromSender:self];
}

- (void) alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
    
    // Only show the user which button they pressed for 'modalWithOptions'
    if (contextInfo == context_modalWithOptions) {
        // Package our information up
        NSDictionary *userInfo;
        if (returnCode == NSAlertSecondButtonReturn) {
            userInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"You Clicked Cancel", @":'(", nil]
                                                   forKeys:[NSArray arrayWithObjects:message, information, nil]];
        } else {
            userInfo = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"You Clicked OK", @":D", nil]
                                                   forKeys:[NSArray arrayWithObjects:message, information, nil]];
        }
        // Set a timer so we don't have a modal sliding out while the previous one is sliding back
        [NSTimer scheduledTimerWithTimeInterval: 0.5
                                         target: self
                                       selector: @selector(handleTimer:)
                                       userInfo: userInfo
                                        repeats: NO];
    }
}

- (IBAction) modalAlert:(id)sender {
    [CIModalSheetDialog showModalMessage:@"Something happened" 
                     withInformativeText:@"You have been informed" 
                               withStyle:NSInformationalAlertStyle 
                              fromSender:self];
}

- (IBAction) modalWithOptions:(id)sender {

    // Here we set a context, allowing us to determine which modal we're dealing with in 
    // - (void) alertDidEnd:(NSAlert *)alert returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo
    [CIModalSheetDialog showModalRequest:@"It's time to choose" 
                     withInformativeText:@"Flip a coin if you can't decide" 
                               withStyle:NSWarningAlertStyle
                              andButtons:[NSArray arrayWithObjects:@"OK", @"Cancel", nil]
                          andContextInfo:context_modalWithOptions
                              fromSender:self];
}

@end
