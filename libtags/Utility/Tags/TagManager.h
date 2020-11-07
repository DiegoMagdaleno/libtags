//
//  TagManager.h
//  libtags
//
//  Created by Diego Magdaleno on 11/7/20.
//

#ifndef TagManager_h
#define TagManager_h

@interface NSURL (TagManager)

- (BOOL)AddTag:(NSString *)targetTag returningError:(out NSError **) error;

- (BOOL)RemoveTag:(NSString *)targetTag returningError:(out NSError **) error;

@end


#endif /* TagManager_h */
