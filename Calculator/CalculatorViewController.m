//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Dmitry on 2012-11-27.
//  Copyright (c) 2012 Dmitry. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringNumber;
@property (nonatomic) BOOL dotWasEntered;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize  display;
@synthesize userIsInTheMiddleOfEnteringNumber;
@synthesize dotWasEntered;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain  = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringNumber)
    {self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringNumber = YES;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.display.text = @"0";
    self.userIsInTheMiddleOfEnteringNumber = NO;
    self.dotWasEntered = NO;
}
- (IBAction)operationPressed:(id)sender {
    if (self.userIsInTheMiddleOfEnteringNumber) {
        [self enterPressed];
    }
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}
- (IBAction)dotPressed {
    if (!self.dotWasEntered&&self.userIsInTheMiddleOfEnteringNumber)
    {
        self.display.text = [self.display.text stringByAppendingString:@"."];
        self.dotWasEntered = YES;
    } else if (!self.userIsInTheMiddleOfEnteringNumber)
    {
        self.display.text = @"0.";
        self.dotWasEntered = YES;
        self.userIsInTheMiddleOfEnteringNumber = YES;
    }
}


@end
