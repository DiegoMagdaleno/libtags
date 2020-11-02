//
//  TagComponents.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#include "TagComponents.h"

@implementation TagComponent

@synthesize name;
@synthesize colorID;

- (id) initWithName:(NSString*)name
         andColorID:(int)colorID{
    if (self = [super init]) {
        self.name = name;
        self.colorID = colorID;
    }
    return self;
}

- (const NSString *) getName {
    return self.name;
}

- (const NSString *) getColorTagName {
    NSString* color;
    
    switch (self.colorID) {
        case 1:
            color = @"Gray";
            break;
        case 2:
            color = @"Green";
            break;
        case 3:
            color = @"Purple";
            break;
        case 4:
            color = @"Blue";
            break;
        case 5:
            color = @"Yellow";
            break;
        case 6:
            color = @"Red";
            break;
        case 7:
            color = @"Orange";
            break;
        default:
            color = @"Unknow";
            break;
    }
    
    return color;
}

@end
