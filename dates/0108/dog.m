#import <stdio.h>
#import <Foundation/NSObject.h>

@interface Dog : NSObject
-(void)bark;
-(void)count;
@end

@implementation Dog
-(void)bark{
    printf("Bow Wow!\n");
}
-(void)count{
    int rndNum = random() % 100;
    int i = 0;
    for (i; i < rndNum; i++){
        printf("%d, ", i);
    }
    printf("\nHmmm... I'm tired...\n");
}
@end

int main(){
    srand((unsigned)time(NULL));
    id obj = [Dog alloc];
    [obj bark];
    [obj count];
    return 0;
}
