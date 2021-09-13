## Welcome to @coadarv Pages

This source will contain all my programs and programming concepts presented for self learning and development.

```
Let the journey of Alphabets to Binary begin!
```

[My git page](https://github.com/codarv/codarv)

### Contact
I could be reached [here](https://www.linkedin.com/in/arvind-dass-8a076740/)

--------------------------------------------------------------------------------------
## Let's Begin!!

--------------------------------------------------------------------------------------

### Print Even and Odd numbers using comprehensive list**
```
num = int(input("Enter a number: "))   

Even = [x for x in range(num) if x > 0 and x % 2 == 0]
Odd = [x for x in range(num) if x > 0 and x % 2 != 0]

print("Even numbers are: " + str(Even))
print("Odd Numbers are: " + str(Odd))
```

### Operations with Lists/Strings
```
# slicing
x = 'codarv'

print(x[1:5])
print(x[:6:2])
print(x[:3])
print(x[3:])
print(x[:-2])
print(x[-2:])
```
#### Output:
```
odar
cdr
cod
arv
coda
rv
```

### Create a list and print it's index and item side by side
```
x = [9, 0, 4]

# item
for item in x:
    print(item)
    
#index & item
for index, item in enumerate(x):
    print(index, item)
```
#### Output:
```
9
0
4
0 9
1 0
2 4
```
### Count occurences of each vowel in the given paragraph
```
Para = "The key difference between the tuples and lists is that while the tuples are immutable objects the lists are mutable. This means that tuples cannot be changed while the lists can be modified. Tuples are more memory efficient than the lists."

y = 0
vowels = ['a', 'e', 'i', 'o', 'u']

for x in vowels:
    y = Para.lower().count(x)
    print(str(x) + ": " + str(y))
```
#### Output
```
a: 13
e: 34
i: 14
o: 5
u: 6
```

### Find the sum of two max numbers, two min numbers in the given List.
```
GList = [10, 8, 9, 1, 87, 12, 6, 20, 5]

print(sum(sorted(GList)[-2:]))

print(sum(sorted(GList)[:2]))
```
#### Output
```
107
6
```
