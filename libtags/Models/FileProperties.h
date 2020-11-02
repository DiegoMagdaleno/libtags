//
//  FileProperties.h
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#ifndef FileProperties_h
#define FileProperties_h

#import <Foundation/Foundation.h>

@interface FileProperties : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *tagStings;

- (id)initWithName:(NSString *)name andTagStrings: (NSArray*) tags;

- (NSArray*) getTagsObject;

- (NSString*) getName;

@end


#endif /* FileProperties_h */
