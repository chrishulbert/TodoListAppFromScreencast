//
//  UIView+Helpers.m
//  TodoListApp
//
//  Created by Chris on 2/04/13.
//  Copyright (c) 2013 Splinter Software. All rights reserved.
//

#import "UIView+Helpers.h"

@implementation UIView (Helpers)

- (UITextField *)addTextFieldWithPlaceholder:(NSString *)placeholder {
    UITextField *textField = [[UITextField alloc] init];
    
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeholder;
    
    [self addSubview:textField];
    
    return textField;
}

@end
