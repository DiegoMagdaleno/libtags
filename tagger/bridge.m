//
//  bridge.m
//  tagger
//
//  Created by Diego Magdaleno on 10/30/20.
//

#import <Foundation/Foundation.h>
#include "bridge.h"
#include "NSURLTagger.h"
#include "TagComponents.h"
#include "FileProperties.h"
#include "TGFileProperties.h"
#include "tagHelpers.h"
#include "GetHelpers.h"

BOOL
setTagForNSURL(NSString* path, NSString* targetTag) {
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:path];
    
    NSMutableArray *appendAbleEditableTags = [NSMutableArray arrayWithArray:[fileURL GetTags]];
    
    if (![appendAbleEditableTags containsObject:targetTag]) {
        [appendAbleEditableTags addObject:targetTag];
    } else {
        return NO;
    }
    
    BOOL success = [fileURL setResourceValue:appendAbleEditableTags forKey:NSURLTagNamesKey error:NULL];
    return success;
}


BOOL
removeTagForNSURL(NSString* path, NSString* targetTag) {
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:path];
    
    NSMutableArray *appendableEditableTags = [NSMutableArray arrayWithArray:[fileURL GetTags]];
    
    if (![appendableEditableTags containsObject:targetTag]) {
        return NO;
    }
    
    [appendableEditableTags removeObject:targetTag];
    BOOL success = [fileURL setResourceValue:appendableEditableTags forKey:NSURLTagNamesKey error:NULL];
    return success;
}


