//
//  addAndRemove.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#include "addAndRemove.h"
#include "NSURLTagger.h"

BOOL
setTagForFile(char const* pathRaw, char const* targetTagRaw){
    
    NSString *path = [NSString stringWithUTF8String:pathRaw];
    NSString *targetTag = [NSString stringWithUTF8String:targetTagRaw];
    
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
removeTagForFile(char const* pathRaw, char const* targetTagRaw) {
    NSString *path = [NSString stringWithUTF8String:pathRaw];
    NSString *targetTag = [NSString stringWithUTF8String:targetTagRaw];
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:path];
    
    NSMutableArray *appendableEditableTags = [NSMutableArray arrayWithArray:[fileURL GetTags]];
    
    if (![appendableEditableTags containsObject:targetTag]) {
        return NO;
    }
    
    [appendableEditableTags removeObject:targetTag];
    BOOL success = [fileURL setResourceValue:appendableEditableTags forKey:NSURLTagNamesKey error:NULL];
    return success;
}
