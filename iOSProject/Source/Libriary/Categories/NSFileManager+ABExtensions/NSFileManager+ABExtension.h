//
//  NSFileManager+ABExtension.h
//  iOSProject
//
//  Created by Andrew Boychuk on 10/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ABExtension)

//returns YES if folder succesfully created at path
- (BOOL)createFolderAtPath:(NSString *)path;
//returns YES if folder was succesfully deleted at path
- (BOOL)deleteFolderAtPath:(NSString *)path;
//creates folder at user document directory
- (BOOL)createFolderAtDocumentsPath:(NSString *)directoryName;


@end
