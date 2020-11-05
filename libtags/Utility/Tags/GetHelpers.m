//
//  GetHelpers.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#import "TagComponents.h"
#import "NSURLTagger.h"
#import "tagHelpers.h"


const NSDictionary*
getTagList() {
    /*
     Reversing Finder Theory:
     l - holds in int that defines the color of the tag (add list of tags here when im done)
     n - stands for name (i think) name of the node
     p - if the user created it or if it was by default seems to be YES if user created it and NO or NULL (?) if it was created by Apple
     v - Unkown requires more research
     */
    NSMutableDictionary *tagListMap = [NSMutableDictionary dictionary];


    NSString *preferencesPath = [NSString stringWithFormat:@"%@/Library/SyncedPreferences/com.apple.finder.plist", NSHomeDirectory()];
    NSURL *finderPrivateFileURL = [[NSURL alloc] initFileURLWithPath:preferencesPath];
    
    NSString *keyTargetPath = @"values.FinderTagDict.value.FinderTags";
    
    NSData *finderPrivateURLData = [NSData dataWithContentsOfURL:finderPrivateFileURL];
    
    NSDictionary *privateFinderAsDict = [NSPropertyListSerialization propertyListWithData:finderPrivateURLData options:NSPropertyListMutableContainers format:NULL error:NULL];
    
    NSArray *flatTags = [privateFinderAsDict valueForKeyPath: keyTargetPath];
    
    for (id eachTagSession in flatTags) {
        
        
        TagComponent *initTagComponentObject = [[TagComponent alloc] initWithName:eachTagSession[@"n"] andColorID:[eachTagSession[@"l"] intValue]];
        
        NSString *targetName = [initTagComponentObject getName];
     
        tagListMap[targetName] = initTagComponentObject;
    
    }
    
    return tagListMap;
}

const NSArray*
getTagsOfFile(NSString* path){
        
    NSMutableArray *fileList = [NSMutableArray array];
    NSMutableDictionary *mappedFiles = [NSMutableDictionary dictionary];
    /*
     * Stage 1:
     * We are now on ObjC so we need to convert our Path str        ing to
     * an NSURL
     */
    BOOL isDir;
    NSArray *folders;
    
    NSURL *directoryURL = [[NSURL alloc] initFileURLWithPath:path];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    [fm fileExistsAtPath:path isDirectory:&isDir];
    
    if (!isDir) {
        folders = @[directoryURL];
    } else {
        folders = [fm contentsOfDirectoryAtURL:directoryURL includingPropertiesForKeys:NULL options:NSDirectoryEnumerationSkipsHiddenFiles error:NULL];
    }
    
    
    for (id eachPathAsURL in folders) {
        NSURL *target = [NSURL fileURLWithPath:[eachPathAsURL path]];
        
        mappedFiles[[target path]] = [target GetTags];
                
        if ([target GetTags] != nil){
            [fileList addObject:target];
        }
        
        
    }
    
    return fromDictionaryToFilePropertiesArray(mappedFiles);
}
