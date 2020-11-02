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
@synthesize tagStings;

NSMutableArray *tags;

- (id)initWithName:(NSString *)name andTagStrings:(NSArray *)tagStrings {
    if (self = [super init]) {
        self.name = name;
        self.tagStings = tagStings;
        NSDictionary *tagDictList = getTagList();
        for (id component in tagStings) {
            [tags addObject:tagDictList[component]];
        }
        
    }
    return self;
}

- (NSArray*) getTagsObject {
    return tags;
}

- (NSString*) getName {
    return self.name;
}




@end
