//
//  TodoManager.h
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoManager : NSObject

+ (instancetype)sharedManager;

@property NSMutableArray *items;

@end
