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

NSString* color;

- (id) initWithName:(NSString*)name
         andColorID:(int)colorID{
    if (self = [super init]) {
        self.name = name;
        self.colorID = colorID;
        
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
            case 4: // There is no tag with the ID of 4
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
    }
    return self;
}

- (const NSString *) getName {
    return self.name;
}

- (const NSString *) getColorTagName {
    return color;
}

@end
