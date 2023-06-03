# Shell example for [Ariadne](https://github.com/gottenheim/ariadne)

## Prerequisites
* Linux is required to install and play with example. On Windows you can use [WSL](https://learn.microsoft.com/en-us/windows/wsl/install), [CygWin](https://www.cygwin.com/) or [MinGW](https://www.mingw-w64.org/).
* [GoLang](https://go.dev/doc/install) is needed, because Ariadne is provided in source code.
* [Git](https://git-scm.com/downloads), to download this example.

## Bootstrap
First, checkout example repository to some directory on your machine
```bash
git checkout https://github.com/gottenheim/ariadne-shell-example.git
```
Then install current version of Ariadne
```bash
make install
```
And you're ready to go!

## Working with cards
Open repository directory in your favorite editor. Navigate to cards directory and open subdirectory 01:

![image](https://github.com/gottenheim/ariadne-shell-example/assets/15375180/f2eae72c-5dd3-48f2-a5c2-a1936bd9a20d)

Here you can see question file and answer file. Question file contains the question you need to answer. You need to replace TODO line with answer you come up with:
```bash
#!/bin/bash

# Show all files in directory /usr/bin in a long listing format

ls -la /usr/bin
```
Now you can execute your command to check its output and fix errors, if any:
```bash
make run CARD=01
```
Then you can check the answer
```bash
make show-answer CARD=01
```
Play with another cards to confirm you understand the idea. 

## Creating new cards
Now let's add a new card:
```bash
make new-card
```
Command created card 04 with new question file. New cards are always populated with files, found in /template directory:

![image](https://github.com/gottenheim/ariadne-shell-example/assets/15375180/05623b87-b419-46f1-ae29-b1e0d2030b3c)

Recommened way to create new question is to create comment with question, write working code that answers the question, save answer to answer file and replace it with TODO comment. We'll now do it step by step. 
Suppose we've just learned a *less* command and want to remember it. Question can be formulated like this:
```bash
#!/bin/bash

# Use paging to show files in directory /usr/bin
```
Fill up the answer:
```bash
#!/bin/bash

# Use paging to show files in directory /usr/bin

ls -la /usr/bin | less
```
Save file and try to run the script:
```bash
make run CARD=04
```
Seems we are on a good track. Now we need to store the answer:
```bash
make compress-answer CARD=04
```
Notice new answer.tgz file appeared in the card directory. It's an archive containing all the card files. The fact it's an archive gives you an additional benefit: you can't peep the answer accidentally by just clicking on a file. Now it's time to remove the answer and replace it with TODO comment:
```bash
#!/bin/bash

# Use paging to show files in directory /usr/bin

# TODO
```
You can always look at the answer if you want:
```bash
make show-answer CARD=04
```
I recommend to always store your cards in git. It gives possibility to undo harmful actions made by mistake and provides complete change history.
