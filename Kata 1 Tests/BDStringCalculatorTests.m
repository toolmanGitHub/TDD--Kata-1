//
//  BDStringCalculatorTests.m
//  Kata 1
//
//  Created by Tim Taylor on 9/1/12.
//  Copyright (c) 2012 Tim Taylor. All rights reserved.
//

#import "BDStringCalculatorTests.h"

@implementation BDStringCalculatorTests

-(void)setUp{
    stringCalculator = [[BDStringCalculator alloc] init];
}

-(void)tearDown{
    stringCalculator = nil;
}

-(void)testThatStringCalculatorExists{
    BDStringCalculator *newStringCalculator = [[BDStringCalculator alloc] init];
    STAssertNotNil(newStringCalculator, @"BDStringCalculator alloc/init should return not nil.");
}

-(void)testThatAddStringMethodExists{
    STAssertTrue([stringCalculator respondsToSelector:@selector(sumForString:)], @"BDStringCalculator should have an sumForString method");
}

-(void)testThatEmptyStringReturnsZero{
    NSInteger returnInteger=[stringCalculator sumForString:@""];
    STAssertTrue(returnInteger==0, @"BDStringCalculator should return 0 for an emptyString, returned %ld",returnInteger);
}

-(void)testThatASingleNumberReturnsTheValue{
    NSInteger returnInteger=[stringCalculator sumForString:@"5"];
    NSInteger expectedResult=5;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator with a single input argument, sumForString should return the argument as an integer.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
    
}

// Performed a refactor.

-(void)testThatTwoCharactersCommaDelimitedReturnsTheSum{
    NSInteger returnInteger=[stringCalculator sumForString:@"4,5"];
    NSInteger expectedResult=9;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator Two Comma Delimited Characters should return the sum.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
}

-(void)testThatUnlimitedNumberOfCommaDelimitedCharactersReturnsTheSum{
    NSInteger returnInteger=[stringCalculator sumForString:@"4,5,9"];
    NSInteger expectedResult=18;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator Unlimited number of comma delimited characters returns the correct sum.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
}

-(void)testThatNewLineDelimitedCharactersReturnsTheSum_TwoCharacters{
    NSInteger returnInteger=[stringCalculator sumForString:@"4\n5"];
    NSInteger expectedResult=9;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator New line delimited characters shold return the sum.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);

}

// Refactor getting the componetns of the string

-(void)testThatThreeNumbersDelimitedEitherWayReturnsTheSum_TestOne{
    NSInteger returnInteger=[stringCalculator sumForString:@"4\n5,6"];
    NSInteger expectedResult=15;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator Three delimited either way should return the sum.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
}

-(void)testThatUnlimitedNumbersDelimitedEitherWayReturnsTheSum_TestOne{
    NSInteger returnInteger=[stringCalculator sumForString:@"4\n5,6,10\n20"];
    NSInteger expectedResult=45;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator Unlimited numbers delimited either way should return the sum.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
}

-(void)testThatNegativeNumberThrowsAnException_TestOne{
    STAssertThrows([stringCalculator sumForString:@"-1"],@"BDStringCalculator should throw an exception when string contains a negative number");
}

-(void)testThatNumbersOneThousandOrGreaterAreIgnored{
    NSInteger returnInteger=[stringCalculator sumForString:@"4\n5,6,10\n20,1000"];
    NSInteger expectedResult=45;
    STAssertTrue(expectedResult==returnInteger, @"BDStringCalculator Numbers greater than or equal to 1000 should be ignored.  Expected:  %ld, Got: %ld",expectedResult,returnInteger);
}

@end
