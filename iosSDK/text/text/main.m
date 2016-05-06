//
//  main.m
//  text
//
//  Created by  wj on 16/4/17.
//  Copyright © 2016年 gzq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Fraction.h"
#import "Calculator.h"
#import "ClassB.h"
#import "Rectangle.h"
#import "Square.h"
#import "XYPoint.h"
#import "Complex.h"
#import "Foo.h"
#import "Fraction+MathOps.h"

int gGlobalVar = 5;

//void exchange(int *pint1,int *pint2){
//    
//    int temp;
//    
//    temp = *pint1;
//    *pint1 = *pint2;
//    *pint2 = temp;
//}

//int arraySum(int *array,int n){
//    int sum = 0 ,*ptr;
//    int *arrayEnd = array + n;
//    for (ptr = array; ptr < arrayEnd; ++ptr) {
//        sum += *ptr;
//    }
//    return sum;
//}

void copyString(char *to,char *from){
    for (; *from != '\0'; ++from,++to) {
        *to = *from;
    }
    *to = '\0';
}

int GetSize(int data[]){
    
    return sizeof(data);
}

bool find(int *a,int rows,int columns,int number){
    
    bool found = false;
    
    if (a != NULL && rows > 0 && columns > 0){
        int row = 0;
        int column = columns - 1;
        
        while (row < rows && columns >= 0) {
            if (a[row *columns +column] == number){
                
                found = true;
                break;
            }else if (a[row *columns +column] > number)
                --column;
            else
                ++row;
        }
    }
    return found;
}

void insert(char a[],int length){
    
    if (a == NULL || length <= 0)
        return;
    
    int n = 0;
    int number = 0;
    while (a[n] != '\0') {
        if (a[n] == ' ')
            ++number;
        ++n;
        
    }
    
    char *p1 = a + n ;
    char *p2 = p1 + 2*number;
    
    if ((n + 2 *number) > length)
        return;
    
    while (p1 != p2) {
        if ( *p1 == ' '){
            *(p2--) = '0';
            *(p2--) = '2';
            *(p2--) = '%';
        }else{
            *(p2--) = *(p1);
        }
        --p1;
    }
    
    
    
}

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        Fraction *myFraction;
//        
//        myFraction = [Fraction alloc];
//        myFraction = [myFraction init];
//        [myFraction print];
//        [myFraction setTo:1 over:3];
        
        
       // NSLog(@"分数为:");
       // [myFraction print];
     //   NSLog(@"%f %i",[myFraction convertToNum],[myFraction denominator]);
        
//        Calculator *deskCale = [[Calculator alloc] init];
//        [deskCale setAccumulator:100.0];
//        [deskCale add:200.0];
//        [deskCale divide:15.0];
//        [deskCale subtract:10.0];
//        [deskCale multiply:5];
//        NSLog(@"结果是%g",[deskCale accumulator]);
        
//        int n,number,triangularNumber ;
//        
//        NSLog(@"输入一个数字:");
//        scanf("%i",&number);
//        
//        triangularNumber = 0;
//        for (n = 1; n <= number; ++n) {
//            triangularNumber += n;
//        }
//        NSLog(@"循环%i次得%i",number,triangularNumber);
//        
//        Fraction * aFraction = [[Fraction alloc] init];
//        Fraction * bFraction = [[Fraction alloc] init];
//        
//        [aFraction setTo:1 over:4];
//        [bFraction setTo:1 over:2];
//        
//        [aFraction print];
//        NSLog(@"+");
//        [bFraction print];
//        NSLog(@"=");
//        
//        
//        [aFraction add:bFraction];
//        [aFraction reduce];
//        [aFraction print];
//
        
//        ClassB *b = [[ClassB alloc] init];
//        
//        [b initVar];
//        [b printVar];
        
//        Rectangle *a = [[Rectangle alloc] init];
//        
//        [a setWidth:3 setHeight:4];
//        
//        
//        NSLog(@"长方形的宽是%i，高是%i",a.width,[a height]);
//        NSLog(@"面积是%i，周长是%i",a.area,[a perimeter]);
//        

//        Square *my = [[Square alloc]init];
//        [my setSide:5];
//        
//        NSLog(@"正方形的边长%i",[my side]);
//        NSLog(@"面积是%i，周长是%i",[my area],[my perimeter]);
        
//        Rectangle *myRect = [[Rectangle alloc]init];
//        XYPoint *myPoint = [[XYPoint alloc]init];
//        
//        
//        [myPoint setX:100 andY:200];
//        
//        [myRect setWidth:5 setHeight:8];
//        [myRect setOrigin:myPoint];
//        
//        NSLog(@"Rectangle w = %i,h - %i",myRect.width,myRect.height);
//        NSLog(@"Origin at (%i,%i)",myRect.origin.x,myRect.origin.y);
//        NSLog(@"Are = %i,perimeter = %i",myRect.area,myRect.perimeter);
//        [myPoint setX:50 andY:50];
//        NSLog(@"Origin at (%i,%i)",myRect.origin.x,myRect.origin.y);
//        
//        XYPoint *theOrigin = myRect.origin;
//        theOrigin.x = 200;
//        theOrigin.y = 300;
//        
//        NSLog(@"Origin at (%i,%i)",myRect.origin.x,myRect.origin.y);

//        Fraction *a = [[Fraction alloc]init];
//        Fraction *b = [[Fraction alloc]init];
//        Fraction *c;
//        
//        Complex *d = [[Complex alloc]init];
//        Complex *e = [[Complex alloc]init];
//        Complex *f;
//        
//        [a setTo:1 over:10];
//        [b setTo:2 over:15];
//        
//        [d setReal:18.0 andImaginary:2.5];
//        [e setReal:-5.0 andImaginary:3.2];
//        
//        [d print];
//        NSLog(@"      +");
//        [e print];
//        NSLog(@"------------");
//        f = [d add:e];
//        [f print];
//        
//        [a print];
//        NSLog(@"     +");
//        [b print];
//        NSLog(@"------------");
//        c = [a add:b];
//        [c print];

//        id dataVal;
//        
//        Fraction *a = [[Fraction alloc]initWith:2 over:5];
//        Complex *b = [[Complex alloc]init];
//        
//        
//        [b setReal:10.0 andImaginary:2.5];
//        
//        dataVal = a;
//        [dataVal print];
//        
//        dataVal = b;
//        [dataVal print];
        
     
//        Foo * myFoo = [[Foo alloc]init];
//        NSLog(@"%i",gGlobalVar);
//        
//        [myFoo setGlobalVal:100];
//        NSLog(@"%i",gGlobalVar);
        
//        Fraction *a,*b;
//        a = [[Fraction allocF]initWith1];
//        b = [[Fraction alloc]init];
//        Fraction *result;
//        
//        [a setTo:2 over:3];
//        [b setTo:2 over:4];
//        
//        result = [a add:b];
//        [result print];
//        result = [a div:b];
//        [result print];

//        __block int foo = 10;
//        
//        void (^printFoo)(void) = ^(void){
//            NSLog(@"foo = %i",foo);
//            foo = 20;
//        };
//        foo = 15;
//        printFoo();
//        printFoo();

//        int i1 = -5,i2 = 66,*p1 = &i1,*p2 = &i2;
//        exchange(p1,p2);
//        NSLog(@"i1 = %i,i2 = %i",i1,i2);
        
//        int values[10] = {3,7,-9,3,6,-1,7,9,1,-5};
//        NSLog(@"The sum is %i",arraySum(values, 10));

//        char string[] = "A string to be copied.";
//        char string2[20];
//        
//        copyString(string2, string);
//        NSLog(@"%s",string2);
//        
//        copyString(string2, "So is this.");
//        NSLog(@"%s",string2);

//        int GetSize(int data[]);
//        int data1[] = {1,2,3,4,5};
//        int size = sizeof(data1);
//        
//        int *data2 = data1;
//        int size2 = sizeof(data2);
//        
//        int size3 = GetSize(data1);
//        
//        printf("%d, %d, %d",size,size2,size3);
        
//        bool find(int *a,int rows,int columns,int number);
//        int ab[4][4] = {{1,2,8,9},{2,4,9,12},{4,7,10,13},{6,8,11,15}};
//        bool b = find(ab, 4, 4, 7);
//        printf("%d",b);

        
//        char str1[] = "hello world";
//        char str2[] = "hello world";
//        
//        char *str3 = "hello world";
//        char *str4 = "hello world";
//        
//        if (str1 == str2){
//            printf("same");
//        }else{
//            printf("not same");
//        }
//        if (str3 == str4){
//            printf("same");
//        }else{
//            printf("not same");
//        }
        
       // void insert(char a[],int length);
        //char ab[] = "my name is guo";
       // printf("%s\n",ab);
       // insert(ab, 5);
       // printf("%s",ab);
        
//        NSNumber *myNumber,*floatNumber,*intNumber;
//        NSInteger myInt;
//        
//        intNumber = [NSNumber numberWithInteger:100];
//        myInt = [intNumber integerValue];
//        NSLog(@"%li",(long)myInt);
//        
//        myNumber = [NSNumber numberWithLong:0xabcdef];
//        NSLog(@"%lx",[myNumber longValue]);
//        
//        myNumber = [NSNumber numberWithChar:'X'];
//        NSLog(@"%c",[myNumber charValue]);
//        
//        floatNumber = [NSNumber numberWithFloat:100.00];
//        NSLog(@"%g",[floatNumber floatValue]);
//        
//        myNumber = [NSNumber numberWithDouble:12345e+15];
//        NSLog(@"%lg",[myNumber doubleValue]);
//        
//        NSNumber *youNumber = [[NSNumber alloc] initWithInt:50];
//        youNumber = [NSNumber numberWithInt:50];

        NSString *str1 = @"This is string A";
        NSString *str2 = @"This is string B";
        NSString *res;
        NSComparisonResult compareResult;
        
        NSLog(@"Length of str1:%lu",[str1 length]);
        
        res = [NSString stringWithString:str1];
        NSLog(@"copy:%@",res);
        
        str2 = [str1 stringByAppendingString:str2];
        NSLog(@"%@",str2);
        
        if ([str1 isEqualToString:res] == YES)
            NSLog(@"==");
        else
            NSLog(@"!=");
        
        compareResult = [str1 compare:str2];
        if (compareResult == NSOrderedAscending)
            NSLog(@"str1 < str2");
        else if (compareResult == NSOrderedSame)
            NSLog(@"==");
        else
            NSLog(@">");
        
        res = [str1 uppercaseString];
        NSLog(@"%@",res);
        
        
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    
}
