//
//  TodoManager.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "TodoManager.h"

#import "TodoItem.h"

@implementation TodoManager

+ (instancetype)sharedManager {
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    if (self = [super init]) {
        TodoItem *item1 = [[TodoItem alloc] init];
        item1.title = @"Take the dog out";
        
        TodoItem *item2 = [[TodoItem alloc] init];
        item2.title = @"Take the garbage out";
        
        _items = [NSMutableArray arrayWithObjects:item1, item2, nil];
    }
    return self;
}

@end
