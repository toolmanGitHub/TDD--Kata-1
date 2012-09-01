//
//  BDStringCalculator.m
//  Kata 1
//
//  Created by Tim Taylor on 9/1/12.
//  Copyright (c) 2012 Tim Taylor. All rights reserved.
//

#import "BDStringCalculator.h"

@implementation BDStringCalculator

-(NSInteger)sumForString:(NSString *)expressionString{
    NSRange rangeOfNegativeNumber=[expressionString rangeOfString:@"-"];
    
    NSAssert(rangeOfNegativeNumber.location==NSNotFound,@"Negative Number cannot be used as an argument");
    
    NSArray *addIns=[self addInsForStringValue:expressionString];
    
    
    return [self sumForAddIns:addIns];
}

-(NSInteger)integerValueForStringValue:(NSString *)stringValue{
    if ([stringValue isEqualToString:@""]) {
        return 0;
    }
    
    return [stringValue integerValue];
}

-(NSArray *)addInsForStringValue:(NSString *)stringValue{
    NSArray *addIns=nil;
    NSCharacterSet *delimitersCharacterSet=[NSCharacterSet characterSetWithCharactersInString:@",\n"];
    
    addIns=[stringValue componentsSeparatedByCharactersInSet:delimitersCharacterSet];

    return addIns;
}

-(NSInteger)sumForAddIns:(NSArray *)addIns{
    __block NSInteger returnResult=0;
    
    [addIns enumerateObjectsUsingBlock:^(NSString *stringValue, NSUInteger idx, BOOL *stop) {
        NSInteger addIn=stringValue.integerValue;
        if (addIn<1000) {
            returnResult+=stringValue.integerValue;
        }
        
    }];
    return returnResult;
}

@end
