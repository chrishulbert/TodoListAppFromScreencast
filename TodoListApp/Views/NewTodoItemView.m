//
//  NewTodoItemView.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "NewTodoItemView.h"

#import "UIView+Helpers.h"

@implementation NewTodoItemView

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
        
        _title = [self addTextFieldWithPlaceholder:@"Title"];
        [_title becomeFirstResponder];
    }
    return self;
}

- (void)layoutSubviews {
    int w = self.bounds.size.width;
    
    _title.frame = CGRectMake(20, 20, w-40, 40);
}

@end
