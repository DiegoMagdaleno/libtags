//
//  FileProperties.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#import "FileProperties.h"
#import "../Utility/Tags/GetHelpers.h"
#import "TagComponents.h"

@implementation FileProperties
@synthesize name;
@synthesize tagStrings;

- (id)initWithName:(NSString *)name andTagStrings:(NSArray *)tagStrings {
    if (self = [super init]) {
        self.name = name;
        self.tagStrings = tagStrings;
    }
    return self;
}

- (NSArray*) getTagsObject {
    NSMutableArray* tags = [NSMutableArray array];
    
    const NSDictionary *tagDictList = getTagList();
    
    for (NSString* component in self.tagStrings) {
        [tags addObject:tagDictList[component]];
    }
    
    return tags;
}

- (NSString*) getName {
    return self.name;
}




@end
