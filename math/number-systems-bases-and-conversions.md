# Number Systems: Bases and Conversions

<a id="base-10-to-base-8"></a>
## Base-10 to Base-8

**Problem:** Convert 150<sub>10</sub> to base-8

1. Order of magnitude: 2
2. 8<sup>2</sup> = 64
3. 150 / 8<sup>2</sup> = 2 % 22
4. 22 / 8<sup>1</sup> = 2 % 6
5. 6 / 8<sup>0</sup> = 6

**Result:** 2266<sub>8</sub>

<a id="formula-for-convert-from-base-10-to-any-base"></a>
## Formula for Convert from Base-10 to any Base
**d = any digit**<br>
**b = base**

d<sub>4</sub>d<sub>3</sub>d<sub>2</sub>d<sub>1</sub>d<sub>0</sub>

**base-10 value:** 
d<sub>4</sub> \* b<sup>4</sup> + d<sub>3</sub> \* b<sup>3</sup> + d<sub>2</sub> \* b<sup>2</sup> + d<sub>2</sub> \* b<sup>1</sup>

**Example:**
32311<sub>4</sub> <br>

| d<sub>4</sub> \* b<sup>4</sup> | + d<sub>3</sub> \* b<sup>3</sup> | + d<sub>2</sub> \* b<sup>2</sup> | + d<sub>2</sub> \* b<sup>1</sup> |
| ------------------------------ | -------------------------------- | -------------------------------- | -------------------------------- |
| 3 \* 4<sup>4</sup> | + 2 \* 4<sup>3</sup> | + 3 \* 4<sup>2</sup> | + 1 \* 4<sup>1</sup> | + 1 \* 4<sup>0</sup> <br> |
| 768                | + 128                | + 48                 | + 4                  | + 1     <br> |

**Result:** 949


<a id="base-16-hexidecimal"></a>
## Base-16 (Hexidecimal)

Numbers greater than 9 are represented by letters:

| Base-16 Digit | Value |
| ------------- | ----- |
| 0-9           | 0-9   |
| a             | 10    | 
| b             | 11    | 
| c             | 12    | 
| d             | 13    | 
| e             | 14    | 
| f             | 15    | 

<a id="base-16-to-base-10-conversion"></a>
### Base-16 to Base-10 Conversion

**Problem:** Convert 3D<sub>16</sub> to Base-10

1. D == 13
2. 3 \* 16<sup>1</sup> = 48
3. 13 \* 16<sup>0</sup> = 13
4. 48 + 13 = 61

**Result:** 61<sub>10</sub>


<a id="base-2-binary"></a>
## Base-2 (Binary)

<a id="base-2-to-base-10"></a>
### Base-2 to Base-10    

**Problem:** Convert 101100<sub>2</sub> to Base-10

**Note:** the order of magnitude is 5 (due to having 6 digits in our number)

| 1 \* 2<sup>5</sup> | + 0 \* 2<sup>4</sup> | + 1 \* 2<sup>3</sup> | + 1 \* 2<sup>2</sup> | + 0 \* 2<sup>1</sup> | + 0 \* 2<sup>0</sup> |
| ------------------ | -------------------- | -------------------- | -------------------- | -------------------- | -------------------- |
| 32                 | + 0                  | + 8                  | + 4                  | +  0                 | +  0                 |

**Result:** 44<sub>10</sub>

<a id="base-10-to-base-2"></a>
### Base-10 to Base-2

**Problem** Convert 65<sub>10</sub> to Base-2:

**Note:** the order of magnitude is 6 (2<sup>6</sup> = 64)

1. 65 / 2<sup>6</sup> = 1 % 1
2. 1 / 2<sup>5</sup> = 0 % 1
3. 1 / 2<sup>4</sup> = 0 % 1
4. 1 / 2<sup>3</sup> = 0 % 1
5. 1 / 2<sup>2</sup> = 0 % 1
6. 1 / 2<sup>1</sup> = 0 % 1
7. 1 / 2<sup>0</sup> = 1

**Result:** 1000001

<a id="binary-to-hex"></a>
### Binary to Hex

1. Take any binary number, and separate it into groups of 4
    1011101<sub>2</sub> = 0101 1011
    (note the added 0 on the left side)
2. Find the value for each group

| 0101               | Hex | 1011               | Hex    |
| ------------------ | --- | ------------------ | ------ | 
| 0 \* 2<sup>3</sup> | 0   | 1 \* 2<sup>3</sup> | 8      |
| 1 \* 2<sup>2</sup> | 4   | 1 \* 2<sup>2</sup> | 4      |
| 0 \* 2<sup>1</sup> | 0   | 0 \* 2<sup>1</sup> | 0      |
| 1 \* 2<sup>0</sup> | 1   | 1 \* 2<sup>0</sup> | 1      |
|                    | 5   |                    | 13 = D |

**Result:** 5D<sub>16</sub>

<a id="converting-hex-to-binary"></a>
### Hex to Binary

**Problem:** Convert B7<sub>16</sub> to Binary

Group 1 - B:

1. 11 / 2<sup>3</sup> = 1 % 3
2. 3 / 2<sup>2</sup>  = 0 % 3
3. 3 / 2<sup>1</sup>  = 1 % 1
4. 1 / 2<sup>0</sup>  = 1
5. Group = 1011

Group 2 - 7:

5. 7 / 2<sup>2</sup> = 1 % 3
6. 3 / 2<sup>1</sup> = 1 % 1
7. 1 / 2<sup>0</sup> = 1
8. Group = 0111 (place 0 in front of group)

**Result:** 10110111<sub>2</sub>

## RGB Conversions

### Hex to RGB

1. Split hex into 3 pairs of 2
2. For each pair:
    a \* 16 + b = c <br>
    if c >= A <br>
        c - 16

**Examples**

| Hex       | 6495AA             |     | 
| --------- | ------------------ | --- |
| **Red**   | 6 \*  16 + 4       | 100 | 
| **Green** | 9 \*  16 + 5       | 149 | 
| **Blue**  | 11 \* 16 + 11 - 16 | 171 | 

**Note:** If Hex >= a, Subtract 16 to get proper total

| Hex       | 649599             |     | 
| --------- | ------------------ | --- |
| **Red**   | 6 \*  16 + 4       | 100 | 
| **Green** | 9 \*  16 + 5       | 149 | 
| **Blue**  | 9 \*  16 + 9       | 153 | 

### RGB to Hex

#### Formula: 
 
1. a = n / 16 (round down)
2. b = n % 16
3. c = a comb b 

#### Examples

**RGB:** 100, 149, 153

Pair 1:

```
a = 100 / 16 = 6 
b = 100 % 16 = 4
c = 64
```

Pair 2:  

```
a = 149/16 = 9 <br>
b = 5 <br>
c = 95
```

Pair 3: 

```
a = 153/16 = 9
b = 153%16 = 9
c = 99
```

**Result:** 649599

