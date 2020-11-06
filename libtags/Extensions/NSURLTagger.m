//
//  NSURLTagger.m
//  tagger
//
//  Created by Diego Magdaleno on 10/30/20.
//

#import <Foundation/Foundation.h>
#import "NSURLTagger.h"


@implementation NSURL (Tags)
- (NSArray *) GetTags
{
    NSArray *currentTags = nil;
    NSError *tagError = nil;
    
    BOOL success = [self getResourceValue:&currentTags forKey:NSURLTagNamesKey error:&tagError];
    
    
    if (success) {
        return currentTags;
    } else {
        return nil;
    }
}
@end
