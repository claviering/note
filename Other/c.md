# C

## 最快的平方根算法

```c++
#include <math.h>
float InvSqrt(float x)
{
 float xhalf = 0.5f*x;
 int i = *(int*)&x; // get bits for floating VALUE
 i = 0x5f375a86- (i>>1); // gives initial guess y0
 x = *(float*)&i; // convert bits BACK to float
 x = x*(1.5f-xhalf*x*x); // Newton step, repeating increases accuracy
 return x;
}

int main()
{
  printf("%lf",1/InvSqrt(3));

   return 0;
}
```

## printf 输出格式化

```c
%d--> for int

%u--> for unsigned int

%ld--> for long int

%lu--> for unsigned long int

%lld--> for long long int

%llu--> for unsigned long long int
```