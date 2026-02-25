#import <stdio.h>
#import <Foundation/NSObject.h>

float rndf(){
    return (double)arc4random() / (double)((1LL<<32)-1);
}
typedef struct Point{float x, y;}Point;

@interface Triangle : NSObject{Point point[3];}
-(id)init; -(Point)get:(int)index;
@end

@implementation Triangle
-(id)init{
    int i = 0;
    for (i; i < 3; i++){
        Point temp = {rndf(), rndf()}; point[i] = temp;
    }
    return self;
}
-(Point)get:(int)index{return point[index];}
@end

int main(){
    id triangle = [Triangle new];
    Point pt0 = [triangle get: 0];
    Point pt1 = [triangle get: 1];
    Point pt2 = [triangle get: 2];
    printf("[%f, %f]-[%f, %f]-[%f, %f]",
        pt0.x, pt0.y, pt1.x, pt1.y, pt2.x, pt2.y);
    return 0;
}