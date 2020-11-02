//
//  TGFileProperties.m
//  tagger
//
//  Created by Diego Magdaleno on 11/1/20.
//

#import <Foundation/Foundation.h>
#import "TGFileProperties.h"
#import "FileProperties.h"

const TGFileProperties*
filePropertiesData(FileProperties *file){
    TGFileProperties *filePropertiesData = malloc(sizeof(TGFileProperties));
    filePropertiesData->name = file.name;
    filePropertiesData->tags = file.tags;
    return filePropertiesData;
}
