//
//  AppDelegate.m
//  ios-prework-objc-assessment
//
//  Created by Joel Bell on 5/23/16.
//  Copyright © 2016 Joel Bell. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *numbersArray = @[];
    NSArray *lettersArray = @[];
    NSDictionary *alphabetDictionary = @{};
    
    numbersArray = [self generateArrayOfNumbers];
    lettersArray = [self generateArrayOfLetters];
    alphabetDictionary = [self generateNumbersAndLettersDictionaryWithNumbers:numbersArray lettersArrayToAdd:lettersArray];
    NSLog(@"%@", alphabetDictionary);
    
    numbersArray = [alphabetDictionary allKeys];
    NSMutableArray *lettersArrayBasedOnKey = [lettersArray mutableCopy];
    
    [lettersArrayBasedOnKey removeAllObjects];
    
    [lettersArrayBasedOnKey addObjectsFromArray:[alphabetDictionary allValues]];
    NSLog(@"%@ \n %@", numbersArray, lettersArrayBasedOnKey);
    
    
    return YES;
}

-(NSArray *)generateArrayOfNumbers {
    NSMutableArray *numbersArray = [[NSMutableArray alloc]init];
    // [nsmutablearray new]
    
//    [@[] mutableCopy];
    
    for (NSUInteger i = 0; i < 26; i++) {
            [numbersArray addObject:@(i+1)];
           }
    
    return numbersArray;
}

//-(NSArray *)generateArrayOfNumbers:(NSNumber *)number {
//    NSMutableArray *numbersArray = [@[]mutableCopy];
//    
//    for (NSUInteger i = 0; i < [number integerValue]; i++) {
//        [numbersArray addObject:@(i+1)];
//    }
//    
//    return numbersArray;
//    
//}

-(NSArray *)generateArrayOfLetters {
    
    NSMutableArray *lettersArray = [@[] mutableCopy];
    char letter = 'a';
    
    for (NSUInteger i = 0; i < 26; i++) {
        char currentLetter = letter + i;
        NSString *letterToAdd = [NSString stringWithFormat:@"%c", currentLetter];
        [lettersArray addObject:letterToAdd];
        
    }
    
    return lettersArray;
    
}

-(NSDictionary *)generateNumbersAndLettersDictionaryWithNumbers:(NSArray *)numbersArray lettersArrayToAdd:(NSArray *)lettersArray {
    
    NSMutableDictionary *numberLetterDict = [@{} mutableCopy];
    
    for (NSUInteger i = 0; i < [numbersArray count]; i++) {
        numberLetterDict[numbersArray[i]] = lettersArray[i];
//        [numberLetterDict setValue:lettersArray[i] forKey:numbersArray[i]];
    }
    
    return numberLetterDict;
    
}

@end
