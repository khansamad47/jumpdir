# Jump Directory
This script provides markers for unix file system for quick access to marked 
directories. This utility will save you countless keystrokes!

## Example
Let say you are currently working on project in the directory ```/home/akhan/Documents/Projects/MyProject```. Using **jumpdir** you can save that path to the directory at a marker and quicky jump to it. All you have to do is:

1. Change directory to your desired directory
2. Run ```jd +<char> (e.g jd +a)```, this will store that present directory as marker 'a'
3. Now to jump to that directory run ```jd <char> (jd a)```

## Usage

|Case|Description|Example|
|----|-----|-----|
|```jd```|list the currently set markers|```$ jd```|
|```jd +<char>```|store current director in market \<char\>|```$ jd +b```|
|```jd`<char>```|change directory to the store directory |```$ jd b```|
