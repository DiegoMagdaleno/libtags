//
//  main.m
//  tagger
//
//  Created by Diego Magdaleno on 10/30/20.
//

#import <Foundation/Foundation.h>
#import "NSURLTagger.h"
#import "bridge.h"
#import "GetHelpers.h"

int main(int argc, const char * argv[]) {
    NSArray* test = getFilesWithCertainMacOSTag(@"/Users/me/Documents/ScreenShots/E.png", @"Orange");
    
    getTagList();
}
