# 位运算符装逼

## 判断奇偶

`n & 1`

## 找出没有重复的数(重复的只能偶数次)

`1^2^3^4^5^1^2^3^4 = 0^0^0^0^5 = 5`

## 快速幂运算

```c
long long int qPow(long long int A, long long int n)
{
  if (n == 0) return 1;
  long long result = 1;
  while (n)
  {
    if (n & 1) // 若幂为奇数
      result *= A;
    A *= A;
    n >>= 1; // 右位移等价于除以2
  }
  return result;
}
```