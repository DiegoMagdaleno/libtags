//
//  FileProperties.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#import "FileProperties.h"

@implementation FileProperties
@synthesize name;
@synthesize tags;

- (id)initWithName:(NSString *)name tags:(NSArray *)tags {
    if (self = [super init]) {
        self.name = name;
        self.tags = tags;
    }
    return self;
}
@end
