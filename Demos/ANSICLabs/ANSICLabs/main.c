#include <stdio.h>

#define FOO "Hello, %s\n", world

int foo;


void displayStringUsingPointer(char *s)
{
    for ( ; *s; s++) {
        printf("address is %p, char is %c\n", s, *s);
    }
}

void displayString(char s[])
{
    for (int i = 0; s[i] != '\0'; i++) {
        printf("address is %p, char is %c\n", &s[i], s[i]);
    }
}

void messWithStringFunctions()
{
    char foo[] = "Hello World!";
    displayString(foo);
    displayStringUsingPointer(foo);
    
    {
        int foo = 3;
        printf("foo is %d\n", foo);
    }
    printf("foo is %s\n", foo);
}

void playWithStrings()
{
    char foo[] = "Hello World!";
//    char *bar = "Hello World!";
    char words[] = { 'a', 'b', 'c', '1', 0 }; // { 'a', 'b', 'c' };
    
    foo[0] = 'J';
    
    for (int i = 0; i < 4; i++) {
        printf("int val is %d, char is %c\n", words[i], words[i]);
    }
    
    printf("string is %s\n", words);
}

void messAroundWithAnArray()
{
    int numbers[10] = { 101, 102, 103 };
    
//    int foobar[10];
//    numbers = foobar;
    
    int x = 3, *y = numbers;
    x++;
    y++;
    
    for (int i = 0; i < 10; i++) {
//        printf("address is %p, value is %d\n", &numbers[i], numbers[i]);
        printf("address is %p, value is %d\n", numbers + i, *(numbers + i));
    }
    
    printf("\n\n=========================\n\n");

    for (int i = 0, *p = numbers; i < 10 ; i++, p++)
    {
        printf("address is %p, value is %d\n", p, *p);
    }
}

void messAroundWithAPointer()
{
    int inches = 18;
    
    int *inchesRef;
    
    inchesRef = &inches;
    
    printf("inches is %d, inchesRef is %p\n", *inchesRef, &inches);
    printf("foo is at address %p\n", &foo);
    printf("value in inchesRef is %d\n", *inchesRef);
    
    *inchesRef += 3;
    printf("value in inchesRef is %d\n", *inchesRef);
    printf("value in inches is %d\n", inches);
}


int main(int argc, const char * argv[])
{
//    char *world = "World!";
//    printf(FOO);
    
//    messAroundWithAPointer();
//    messAroundWithAnArray();
//    playWithStrings();
    messWithStringFunctions();
    
    return 0;
}
