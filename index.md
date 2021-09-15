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

### Program to send custom email
```
import smtplib
import ssl

smtp_server = "smtp.gmail.com"
port = 587  # For starttls
sender_email = "codarvtest@gmail.com"
password = input("Type your password and press enter: ")

# Create a secure SSL context
context = ssl.create_default_context()

# Try to log in to server and send email
try:
    server = smtplib.SMTP(smtp_server, port)
    server.ehlo()  # Can be omitted
    server.starttls(context=context)  # Secure the connection
    server.ehlo()  # Can be omitted
    server.login(sender_email, password)
    name = sender_email.split('@')[0]
    print(name)
    # TODO: Send email here
    subject = 'Saying Hello from Python'
    body = 'Hi ' + name + "," + "\nThis is a test message from Python"

    msg = f'Subject: {subject}\n\n{body}'

    server.sendmail(sender_email, sender_email, msg)

except Exception as e:
    # Print any error messages to stdout
    print(e)
finally:
    server.quit()
```

