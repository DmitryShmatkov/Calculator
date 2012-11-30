//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Dmitry on 2012-11-28.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void)pushOperand: (double)operand;
- (double)performOperation: (NSString *) operation;
@end
