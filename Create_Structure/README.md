

This script is used to build the structure and save my exercises done in [Codewars](https://www.codewars.com/)

# Problem

Since I started to develop the CodeWars exercises my idea was to saved them and nothing better that puth in my Github page.
The Codewars exercises have three important parts: 

1. The description of the problem 
2. The tests that will run to test our solution
3. And, the most important part, our solution

So, I figured that in orther to have a nice repository with all information I need to provide these three parts.

# CodeWars Structure

CodeWars contains several exercises divided by difficulty and you can choose the programming Language that you want to use.
Regardind the difficulty we have 8kyu to 1kyu (easy --> hard).

# The Script

The script flows as follow:

1. Ask for the name of the project:
    The code file will have this name (plus the extension of the language that you are using)

    :warning: **If you want to change the language extension**: go to line 127 of the script and change the extension 

2. Ask for the difficulty:
    Insert a difficulty between 8kyu and 1kyu. This will create a folder with this name or open if already exists.

3. The number of the exercise that you are developing regarding the difficulty
    This is very important because if you already develop an exercise with the same difficulty this will help to build the README.md file inside the difficulty folder.

4. The CodeWars link:
    Similar to the previous point, this information will appear in the README.md file.



# Running the Script

1) Set execute permission on your script:

        chmod +x script-name-here.sh

2) To run your script, enter:

        ./script-name-here.sh
    OR
    
        sh script-name-here.sh
    OR

        bash script-name-here.sh


# Check the structure on my own [Repo](https://github.com/lfteixeira996/CodeWars/tree/master/Python)
