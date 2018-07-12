# Number Systems: Bases and Conversions

<!-- MarkdownTOC -->

* [Base-10 to Base-8](#base-10-to-base-8)
* [Formula for Convert from Base-10 to any Base](#formula-for-convert-from-base-10-to-any-base)
* [Base-16 \(Hexidecimal\)](#base-16-hexidecimal)
    * [Base-16 to Base-10 Conversion](#base-16-to-base-10-conversion)
* [Base-2 \(Binary\)](#base-2-binary)
    * [Base-2 to Base-10](#base-2-to-base-10)
    * [Base-10 to Base-2](#base-10-to-base-2)
    * [Binary to Hex](#binary-to-hex)
    * [Converting Hex to Binary](#converting-hex-to-binary)

<!-- /MarkdownTOC -->

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

| 0101               |                      |                      |                      | Total  |
| ------------------ | -------------------- | -------------------- | -------------------- | ------ |  
| 0 \* 2<sup>3</sup> | + 1 \* 2<sup>2</sup> | + 0 \* 2<sup>1</sup> | + 1 \* 2<sup>0</sup> |        |  
| 0                  | 4                    | 0                    | 1                    | 5      |  
| **1101**           |                      |                      |                      |        |
| 1 \* 2<sup>3</sup> | + 1 \* 2<sup>2</sup> | + 0 \* 2<sup>1</sup> | + 1 \* 2<sup>0</sup> |        |  
| 8                  | 4                    | 0                    | 1                    | 13 = D |


| 0101               | Hex | 1011               | Hex |
| ------------------ | --- | ------------------ | --- | 
| 0 \* 2<sup>3</sup> | 0   | 1 \* 2<sup>3</sup> | 8   |
| 1 \* 2<sup>2</sup> | 4   | 1 \* 2<sup>2</sup> | 4   |
| 0 \* 2<sup>1</sup> | 0   | 0 \* 2<sup>1</sup> | 0   |
| 1 \* 2<sup>0</sup> | 1   | 1 \* 2<sup>0</sup> | 1   |
|                    | 5   |                    | 13  |

**Result:** 5D<sub>16</sub>

<a id="converting-hex-to-binary"></a>
### Converting Hex to Binary
    B716
    [11]716 ([11]7 in Base-16) 

    11/2^3 = 1 % 3
    3/2^2 = 0 % 3
    3/2^1 = 1 % 1
    1/2^0 = 1
    1011

    7/2^2 = 1 % 3
    3/2^1 = 1 % 1
    1/2^0 = 1
    0111
        Note: place 0 in front of group
    1011 comb 0111
    101101112 (10110111 in Base-2)



Formula for converting Hex to RGB:
    Split hex into 3 pairs of 2
    For each pair
        a*16+b = c
        if c >= A
            c - 16

    Examples:
        Hex: 6495AA
        R: 6*16+4 = 100
        G: 9*16+5 = 149
        B: 11*16+11 = 187 - 16 = 171

        Hex: 649599
        R: 6*16+4 = 100
        G: 9*16+5 = 149
        B: 9*16+9 = 153

        Hex: 6495ED
        R: 6*16+4 = 100
        G: 9*16+5 = 149
        B: 15*16+14 = 254 -16 = 238


        RGB to Hex
            a = n/16 (round down)
            b = n%16
            c = a comb b 
            Multiply decimal remainder by 
        RGB: 100, 149, 153
        Pair 1: 
            a = 100/16 = 6 
            b = 100%16 = 4
            c = 64
        Pair 2:  
            a = 149/16 = 9
            b = 5
            c = 95
        Pair 3: 
            a = 153/16 = 9
            b = 153%16 = 9
            c = 99
        Hex = 649599