//
//  CIModalSheetDialogAppDelegate.h
//  CIModalSheetDialog
//
//  Created by Michael Robinson on 24/11/11.
//  Copyright 2011 ECPod. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CIModalSheetDialogAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
}

- (IBAction) modalAlert:(id)sender;
- (IBAction) modalWithOptions:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end
