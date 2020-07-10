# AIQRating

Rating calculation program for AIQ Online.

# Implementation Methods
* Language : Haskell2010, SQLite3

# Execution Procedure
1. Enter activity information and results
2. Calculate rates
3. Check that the updates are correct
4. Update the sqlite file
5. Display the update results

# Required Function
* Rate fluctuation calculations & updates
* Record of results

# Database

## Rate

|Key|Type|NOT NULL|PRIMARY|
|-|-|-|-|
|NO|INTEGER|Yes|Yes|
|NAME|TEXT|Yes||
|RATE|REAL|Yes||
|UPDATE_TIME|TEXT|||


## Activity

|Key|Type|NOT NULL|PRIMARY|
|-|-|-|-|
|NO|INTEGER|Yes|Yes|
|ROOM|INTEGER|Yes||
|DATE|TEXT|Yes||


### Room
|Value|Room|
|-|-|
|1|Prelude|
|2|Overture|
|3|Interlude|
|4|Fantasia|
|5|Cappriccio|


## Record

|Key|Type|NOT NULL|PRIMARY|
|-|-|-|-|
|NO|INTEGER|Yes|Yes|
|ACTIVITY|INTEGER|Yes||
|PLAYER|INTEGER|Yes||
|RANK|INTEGER|Yes||
|SCORE|INTEGER|Yes||
|CORRECT|INTEGER|Yes||
|WRONG|INTEGER|Yes||
|BEFORE_RATE|REAL|Yes||
|AFTER_RATE|REAL|Yes||


# LICENSE
[BSD-3](LICENSE)
