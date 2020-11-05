//
//  TagComponents.h
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#ifndef TagComponents_h
#define TagComponents_h

#import <Foundation/Foundation.h>

@interface TagComponent : NSObject
@property (nonatomic, strong) NSString *name;
@property (assign) int colorID;

- (int) colorID UNAVAILABLE_ATTRIBUTE;

- (id) initWithName:(NSString*)name andColorID:(int)colorID;
- (NSString*) getName;
- (NSString*) getColorTagName;

@end

#endif /* TagComponents_h */
