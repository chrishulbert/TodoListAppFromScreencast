//
//  TodoItem.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

- (id)initWithJsonDictionary:(NSDictionary *)json {
    if (self = [super init]) {
        _title = json[@"title"];
    }
    return self;
}

- (NSDictionary *)jsonDictionary {
    return @{@"title": _title};
}

@end
