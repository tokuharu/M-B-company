//
//  main.c
//  format001
//
//  Created by tokunakaharuyuki on 2019/02/12.
//  Copyright © 2019 M&B company. All rights reserved.
//

#include<stdio.h>

int main()
{
    int a, b, c;
    
    a = 10;                //変数aに10を代入
    b = 15;                //変数bに15を代入
    
    c = a + b;             //変数cに(a+b)の値を代入
    
    printf("%dたす%dは%dです。\n", a, b, c);
    
    return 0;
}
