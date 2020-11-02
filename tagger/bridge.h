//
//  bridge.h
//  tagger
//
//  Created by Diego Magdaleno on 10/30/20.
//

#ifndef bridge_h
#define bridge_h

#import <Foundation/Foundation.h>

const NSArray* getFilesWithCertainMacOSTag(NSString*, NSString*);
BOOL setTagForNSURL(NSString*, NSString*);

#endif /* bridge_h */
