//
//  TGFileProperties.h
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#ifndef TGFileProperties_h
#define TGFileProperties_h

#import <Foundation/Foundation.h>
#import "FileProperties.h"

typedef struct _TGFileProperties {
    NSString *name;
    NSArray *tags;
} TGFileProperties;

const TGFileProperties* filePropertiesData(FileProperties *file);

#endif /* TGFileProperties_h */
