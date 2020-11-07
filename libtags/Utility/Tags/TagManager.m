//
//  addAndRemove.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#include "NSURLTagger.h"
#include "TagManager.h"

@implementation NSURL (TagManager)

- (BOOL)AddTag:(NSString*)targetTag returningError:(NSError **) error {
        
    NSMutableArray *appendableEditableTags = [NSMutableArray arrayWithArray:[self GetTags]];
    
    NSDictionary *alreadyContained = @{
        NSLocalizedFailureReasonErrorKey: NSLocalizedString(@"Desired URL already contains resource tag", nil),
        NSLocalizedRecoverySuggestionErrorKey:
            NSLocalizedString(@"Maybe try an URL that doesn't contain the resource tag", nil),
    };
    
    if ([appendableEditableTags containsObject:targetTag]) {
        *error = [NSError errorWithDomain:@"com.diegomagdaleno.libtags" code:30 userInfo:alreadyContained];
        return NO;
    }
    
    [appendableEditableTags addObject:targetTag];
    
    BOOL success = [self setResourceValue:appendableEditableTags forKey:NSURLTagNamesKey error:error];

    return success;
}

- (BOOL)RemoveTag:(NSString*)targetTag
       returningError:(NSError **) error{
    
    NSMutableArray *appendableEditableTags = [NSMutableArray arrayWithArray:[self GetTags]];
    
    NSDictionary *notContained = @{
        NSLocalizedFailureReasonErrorKey:
            NSLocalizedString(@"Desired URL does not contain resource tag. Cannot remove.", nil),
        NSLocalizedRecoverySuggestionErrorKey:
            NSLocalizedString(@"Maybe try an URL that does contain the resource tag", nil),
    };
    
    if (![appendableEditableTags containsObject:targetTag]) {
        *error = [NSError errorWithDomain:@"com.diegomagdaleno.libtags" code:31 userInfo:notContained];
        return NO;
    }
    
    [appendableEditableTags removeObject:targetTag];
    
    BOOL success = [self setResourceValue:appendableEditableTags forKey:NSURLTagNamesKey error:error];
    
    return success;
}

@end
