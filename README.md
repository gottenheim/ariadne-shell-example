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

## Studying cards
Answering all questions every time would be tedious. To avoid it, Ariadne contains command that shows you a limited set of new questions every day. After learning, question is scheduled to another day, according to [SM2](https://en.wikipedia.org/wiki/SuperMemo) algorithm, used in [SuperMemo](https://supermemo.com/en) and [Anki](https://apps.ankiweb.net/).
To enter study mode, type command
```bash
make study-cards
```

![image](https://github.com/gottenheim/ariadne-shell-example/assets/15375180/aaafa794-76e6-465b-a620-40845663ef34)

You will be given all the question files and complete path to card directory. As explained in previous section, you need to open corresponding question.sh, remember answer (or maybe realize you can't), type answer, check it and return to study mode. 
Hit enter and see the right answer:

![image](https://github.com/gottenheim/ariadne-shell-example/assets/15375180/fadb1410-e583-408c-9a2d-ca45257a4384)

Now you need to choose the most relevant option for your situation:
* Press A if you forgot the answer completely,
* Press H if you got the correct answer but significant effort was required to recall it,
* Press G if you got the correct answer after some hesitation,
* Press E if you came up with the result almost instantly.

In the same way, you'll be given all cards planned for today. Default limits are hardcoded in makefile and equal to 10 for new cards and cards scheduled to remind today. You can always change them manually.
Progress for every card is stored in .activities file in card directory, don't forget to commit these files after study session.

Thanks a lot for reading! Feel free to leave feedback in GitHub issues or contact me directly via Telegram or LinkedIn (information is in my profile). 
