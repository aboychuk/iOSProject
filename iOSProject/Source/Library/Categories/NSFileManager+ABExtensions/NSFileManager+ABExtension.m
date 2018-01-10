//
//  NSFileManager+ABExtension.m
//  iOSProject
//
//  Created by Andrew Boychuk on 10/3/17.
//  Copyright © 2017 Andrew Boychuk. All rights reserved.
//

#import "NSFileManager+ABExtension.h"

@implementation NSFileManager (ABExtension)

- (BOOL)createFolderAtPath:(NSString *)path {
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        return YES;
    } else {
        [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    }
    
    return nil != error;
}

- (BOOL)deleteFolderAtPath:(NSString *)path {
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        [fileManager removeItemAtPath:path error:&error];
    }
    
    return nil != error;
}

- (BOOL)createFolderAtDocumentsPath:(NSString *)folderName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *directoryPath = [[paths firstObject] stringByAppendingPathComponent:folderName];

    return [self createFolderAtPath:directoryPath];
}

@end
