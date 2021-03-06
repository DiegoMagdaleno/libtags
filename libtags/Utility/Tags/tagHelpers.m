//
//  tagHelpers.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#include "FileProperties.h"
#include "tagHelpers.h"

NSArray*
fromDictionaryToFilePropertiesArray(NSDictionary *targetDict) {
    NSMutableArray *objectList = [NSMutableArray array];
    
    
    for (id key in targetDict) {
        FileProperties *target = [[FileProperties alloc] initWithName:key andTagStrings:[targetDict objectForKey:key]];
        [objectList addObject:target];
    }
    
    return objectList;
}
