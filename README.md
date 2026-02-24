Problem Set 5: Spell Checker
============================
*Computer Programming for Lawyers - Spring 2026*

Introduction
------------

In this assignment, you will begin to work on files full of text, culminating in a functional
spell-checking program. You will demonstrate your mastery of lists, for-loops, strings, and dictionaries.

This repository contains the following files:
* `word_list.txt` (235,886 English words, from the MacOS).
* `word_list_small.txt` (296 English words, for use with `declaration.txt`).
* `declaration.txt` (a file containing the first two paragraphs of the declaration of independence, for use with `word_list_small.txt`).
* `alice.txt` (a file containing the Mad Hatter chapter of Alice in Wonderland).
* `brandeis.txt` (a file containing Justice Brandeis's dissent in Olmstead v. United States, 277 U.S. 438, 471 (1928))
* `clean.ipynb` (starter code for the first task of this assignment)

Expectations
------------
* This is an individual assignment. The standard course collaboration policy applies.
* You are permitted to use only the Python features we have covered so far (Chapters 1-10).
* You should use effective programming style. A portion of your grade will be
determined by your programming style.
  * Please continue to adhere to the [Style Guide](https://github.com/Computer-Programming-for-Lawyers/Spring-2026/blob/main/style-guide.md).

Summary of Tasks
----------------

* Build and submit file `clean.ipynb`
* Build and submit file `spell.ipynb`

Task 1 is worth up to 2 points, and Task 2 is also worth up to 2 points (aka, there are 4 total possible points one can earn on this assignment). Task 2 is broken into four parts: **You should hand in only one copy of spell.ipynb, a version that incorporates Parts A through D.**

As a reminder, there is no formal 'submit' button on GitHub Classroom. As long as you complete your work in Codespaces and commit and push your work once complete, we will be able to see your final product. For a reminder on how to commit and push your work, see the file `codespaces-instructions.md` (as a reminder, you can open this file by clicking on it in the file explorer, or by entering `code codespaces-instructions.md` into the terminal).

Start Early
-----------

We hope this message is abundantly clear by now. This problem set is much more involved than the previous three. Start early, do a little bit of work each day, ask questions on Ed and in office hours!


Roadmap
-------

Lawyers focus on text more than any other type of data, so it's natural that lawyer-programmers
should learn how to process text. This problem set will ask you to process
large text files in order to do some useful things. This is also the first assignment that will culminate
in a truly self-contained and useful piece of software: a working spell
checker that will try to suggest the correct spelling of a misspelled word.

Task 1: clean.ipynb
----------------

A crucial (if somewhat hated) step of any form of data analysis is _data cleaning_. Most data you'll deal with in the real world will be inconsistent, messy, or formatted for a different purpose. Some of these flaws come from humans (think data entry errors) and others come from technical sources (think corrupted files). An analyst cleans data by creating little programs to remove the errors, resolve the inconsistencies, and recover the corrupted information. Data cleaning tends to be a painstaking process.

The other task in this problem set processes texts at the level of the individual word, as opposed to the line, sentence,
paragraph, or character. To clean a text so it is ready for analysis, we must transform paragraphs of information into lists of individual words.
*Your task is to write a program that will isolate the individual words of a text from all of the whitespace and punctuation
in the input text file.*

Complete the program started for you in `clean.ipynb`. Your program should turn files containing arbitrary text into lists of cleaned words. These clean words will be written to a second file, one word per line (the first time all semester we've written data to a new file). These files full of cleaned words will be analyzed in the other task of this assignment. Remember that we will test your code using different text files, so you might try to download texts from the Internet to stress test your code (many public domain books are available in `.txt` form).

`clean.ipynb` reads two filenames as input: the name of a file containing arbitrary text (such as a Supreme Court opinion) and the name of a file to which it should store the result of the cleaning process.

We have provided you with some starter code to help you get up and running. Specifically, our starter code
already includes a few lines at the beginning that read the contents of the input text file into a string variable called `text`
and a few lines at the end that write the content of a list of strings called `words` to the output text file (one word per line).

You will need to fill in the rest of the file, which asks for the file names as input, cleans the string stored in `text`, and stores the resulting strings into a list called `words`. Your cleaning process should perform the following steps in the following order:

1. Remove any of the following punctuation from any place in the text: `,!.?;"()\:-'`. We have provided these characters in a constant called `PUNCTUATION` at the
beginning of the starter code. (Hints: (1) Strings are lists of characters--meaning that you can use a `for` loop to loop over its elements. (2) Consider the string `.replace()` method.)

	*Be sure you understand what we are asking you to do in this step.* You are meant to _remove_ punctuation, even if doing so results in something that is no longer an English word. For example, this will turn the contraction "isn't" into the non-word "isnt"; it will mush together two words surrounding a hyphen turning "writing-desk" into "writingdesk"; and it will even mush together two words surrounding a lot of spaceless punctuation turning "Happiness.--That" into "HappinessThat". You are not expected to "fix" these cases, and thus your end product will include a lot of "words" that aren't proper English words as a result.

2. Convert all words to lowercase. The end result should contain `wiretap` rather than `Wiretap`. And, yes, even words that properly have an uppercase letter, such as `I`, must be lowercased.

3. Break the text into a list of words, in the process removing all whitespace between words.

4. Remove any words that do not consist solely of letters. (e.g. `brandeis.txt` contains citations, and none of their volume numbers or page numbers should end up in the clean data.)

Take care to use exactly these two variable names: `text` for the input string and `words` for the list of cleaned words. You can use other, temporary variables to store related data in between, but start with `text` and end with `words`.

We include a few examples below. If you process the `alice.txt` file like so:

```
Input file: alice.txt
Output file: alice_clean.txt
```

and you look in the new file `alice_clean.txt`` that has appeared in your Codespace, the first few lines of the file should be:

```
chapter
vii
a
mad
teaparty
there
was
a
table
set
...(many lines omitted)
```

If you process the `brandeis.txt` file like so:

```
Input file: brandeis.txt
Output file: brandeis_clean.txt
```

and you look in the new file `brandeis_clean.txt` that has appeared in your Codespace, the first few lines of the file should be:

```
mr
justice
brandeis
dissenting
the
defendants
were
convicted
of
conspiring
...(many lines omitted)
```


*A word of warning:* Since this is the first time you have created a program that can write to a file, we'll take a
moment here to give you a word of warning. When Python writes to a file, it permanently deletes any pre-existing versions
of the file. For emphasis, *there is no way to recover a file once you have overwritten it with Python.* If you use
Python to write to a file called `very_important_brief.docx`, you will permanently delete the existing version of
`very_important_brief.docx`. To keep you from shooting yourself in the foot, the starter code for `clean.ipynb` will print an error message if you tell it to overwrite your input file or to overwrite a python file. But you can still overwrite other files if you're not careful with your code. Because you're working in Codespaces, you won't be at risk of deleting files on your local computer. If you accidentally overwrite any of the text files in your Codespace, you can find copies of them in the [template repository for this Problem Set](https://github.com/Computer-Programming-for-Lawyers/ps5).

***

Task 2: spell.ipynb
----------------

Now, let's build a spell checker.

We'll tackle this in four parts. **You should hand in only one copy of spell.ipynb, a version that incorporates Parts A through D.**

**IMPORTANT NOTE: Make sure each part of your program is working before moving to the next part.**

### Part A: The Basic Spell-Checker

Because it can get a bit ungainly working with large files with thousands of words, we've given you a small example that you should initially work to spell-check. The file is called `declaration.txt` and contains the first two paragraphs of the Declaration of Independence, 353 words long, with some spelling errors intentionally introduced by us. It is meant to be used with `word_list_small.txt`, a list of just 296 (correctly-spelled) words that is derived from the words in `declaration.txt`.

Once your code works well on `declaration.txt`, you can move on to the other two, longer texts, `alice.txt` and `brandeis.txt`, to which we have also intentionally introduced some spelling errors. Both of these larger files are meant to be used with a more complete file of correctly-spelled words called `word_list.txt`.

Remember that you're not supposed to be working with `declaration.txt`, `alice.txt`, or `brandeis.txt` directly in this task. Instead, request as input the name of a text file full of words as generated by your completed `clean.ipynb`. (e.g. `alice_clean.txt` or `brandeis_clean.txt` in the previous examples). Also request as input the name of the appropriate word_list file. (We have already cleaned the word_list files as if they had been run through `clean.ipynb`.)

*For each word (i.e., a "test word") found in the cleaned input text that is not in the word_list of properly spelled words, your program should report a potential misspelling by printing each potentially misspelled word on a line by itself. Don't get too caught up in thinking of this as a spell checker: In essence, you're checking whether words from one text file are in another list of words that are confirmed to be spelled correctly.*

Sample outputs are as follows. The first output is printed in full. The other two are just excerpts:

```
Input file: declaration_clean.txt
Word list file: word_list_small.txt

states
events
bands
powers
sttaion
laws
naturev
opinions
requires
theg
causes
truths
selfevident
created
endowed
rights
happinessthat
rights
governments
instituted
deriving
powers
governed
ends
rigvht
enw
principles
organizing
powers
governments
changed
causes
shewn
evils
ot
abolishing
forms
abuses
usuppations
pursuing
evinces
guards
futrue
securitysuch
has
colonies
constrains
systems
presyent
injuries
usurpations
having
states
facts
submitted
```

```
Input file: alice_clean.txt
Word list file: word_list.txt

vii
teaparty
having
using
elbows
looked
remarked
isnt
invited
wants
hte
remarks
... (hundreds of additional "misspelled" words)
```

```
Input file: brandeis_clean.txt
Word list file: word_list.txt

brandeis
defendants
convicted
persons
charged
arrested
indicted
telephones
means
communicated
... (hundreds of additional "misspelled" words)
```

If you want to know why so many properly spelled words are being flagged as misspellings, peek ahead at the Epilogue of this assignment.


### Part B: Suggesting Corrections

Let's improve on this spell checker. To emulate the spell checker you are used to in Microsoft Word or Google Docs, *your program must also recommend
words from the word_list file that the user might have meant instead of the misspelled word, by applying a heuristic.*
To a computer programmer, a *heuristic* is a rule-of-thumb that is effective an acceptable amount of the time.

Your spell checker won't be quite as intelligent as a commercial spell
checker: it will explore only a single heuristic, the "stray
insertion" heuristic, which recognizes that typists sometimes insert
an extra character that does not belong. Instead of spelling `bread`,
a user might accidentally type `breead` or `breatd`.

Whenever you detect a misspelled word, apply this heuristic to generate a list of every possible string of characters the user might have meant to have typed instead. To be clear, most of the candidates you generate will be gibberish that aren't real words. We'll get rid of all of those gibberish words in a later step. For now, just come up with every word the user might have meant to have typed.

You must test this heuristic exhaustively. So you need to consider the word with the first letter removed, the second letter removed, and so on, all the way to the word with the final letter removed. **Figuring out how to generate all of these subtle variations is probably the hardest part of the assignment. Post on Ed if you're struggling.** As a hint, break up the misspelled word into smaller parts that you then reassemble through concatenation. So, let's say the input includes the misspelled word `breatd` rather than `bread`. To apply the heuristic, you will need to generate all of the following possibilities:

```
reatd
b + eatd
br + atd
bre + td
brea + d # This is the right one
breat
```

You'll need to use a for-loop to generate these six possibilities. Inside this for-loop, how do you create the small sub parts on each line above (such as `eatd`, `br`, or ,`td`)? The answer is by generating slices ("bread slices", heh) with carefully selected indices. Pay close attention to our coverage of slices and concatenation in lecture and lab.

Once you have created a list of every single possible correction produced by the heuristic, you must next get rid of the gibberish non-words. To do this, you must filter out those that do not appear in the word_list. The small number of words that remain are possible corrections that you should recommend to the user.

As output, whenever your program detects a misspelling, print on one line: the word, the characters `->` surrounded by spaces, and the list of recommendations separated by commas and spaces. For example:

`events -> evens, event`

If you did not find any candidates in the word_list, meaning you have no good guesses for what the user might have meant, in place of suggestions, print the string `(No suggestions)`, like so:

`endowed -> (No suggestions)`

Be aware that testing the heuristic on dozens of misspellings can take a long time! This is the first time you will have written code that may take minutes rather than seconds to run. This is why we have you start with `declaration.txt`, which should run in a matter of seconds, even on relatively slow computer hardware.

Sample outputs are as follows. The first output is printed in full. The other two are just excerpts:

```
Input file: declaration_clean.txt
Word list file: word_list_small.txt

states -> tates, state
events -> evens, event
bands -> band
powers -> power
sttaion -> (No suggestions)
laws -> las, law
naturev -> nature
opinions -> opinion
requires -> require
theg -> the
causes -> cause
truths -> truth
selfevident -> (No suggestions)
created -> create
endowed -> (No suggestions)
rights -> right
happinessthat -> (No suggestions)
rights -> right
governments -> government
instituted -> institute
deriving -> driving
powers -> power
governed -> (No suggestions)
ends -> ens, end
rigvht -> right
enw -> (No suggestions)
principles -> principes, principle
organizing -> (No suggestions)
powers -> power
governments -> government
changed -> change
causes -> cause
shewn -> hewn, sewn, shen
evils -> evil
ot -> t, o
abolishing -> (No suggestions)
forms -> form
abuses -> abuse
usuppations -> (No suggestions)
pursuing -> (No suggestions)
evinces -> evince
guards -> guard
futrue -> (No suggestions)
securitysuch -> (No suggestions)
has -> as, ha
colonies -> (No suggestions)
constrains -> constrain
systems -> system
presyent -> present
injuries -> (No suggestions)
usurpations -> usurpation
having -> (No suggestions)
states -> tates, state
facts -> acts, fact
submitted -> (No suggestions)
```

```
Input file: alice_clean.txt
Word list file: word_list.txt

vii -> (No suggestions)
teaparty -> (No suggestions)
having -> (No suggestions)
using -> sing
elbows -> elbow
looked -> (No suggestions)
remarked -> (No suggestions)
isnt -> ist
invited -> invite
wants -> want
hte -> te, he
remarks -> remark
... (hundreds of additional "misspelled" words)
```


```
Input file: brandeis_clean.txt
Word list file: word_list.txt

brandeis -> (No suggestions)
defendants -> defendant
convicted -> (No suggestions)
persons -> person
charged -> charge
arrested -> (No suggestions)
indicted -> (No suggestions)
telephones -> telephone
means -> mans, mean
communicated -> communicate
... (hundreds of additional "misspelled" words)
```



### Part C: Using a dictionary to create a cache

In the final two tasks, we will modify our code to use a dictionary, rather than a list. This will keep track of our program's work, making it far more efficient and better organized.

We will greatly improve the performance of this code, meaning it will run in less time on `alice.txt` and `brandeis.txt`.

The process of generating every possible correction for every misspelled word generates several candidates, taking a small amount of processor time that can add up for very long texts. Your program should try to avoid this work whenever possible. **Whenever your program attempts to correct a misspelling and generates these candidates, it should save the fruits of this labor to a dictionary, where the key is the misspelling and the value is the string containing the candidates separated by commas and spaces or the phrase "(No suggestions)". When your program sees this misspelling in the future, it should retrieve the response message from this dictionary rather than generating them again from scratch.** The idea that we should save previous computation so we don't have to do it a second time is known as _dynamic programming_, and the dictionary you create in the process of doing so is called a _cache_. 

When you report a misspelling for the second or subsequent time using the cache (what is known as a "cache hit"), print an asterisk after the word in your output to indicate that the cache was used.

For example, the Declaration of Independence example includes the word "rights" twice. The second time your program comes across it, it should print:

```
rights -> right*
```

Sample outputs are as follows for `declaration_clean.txt`:

```
Input file: declaration_clean.txt
Word list file: word_list_small.txt

states -> tates, state
events -> evens, event
bands -> band
powers -> power
sttaion -> (No suggestions)
laws -> las, law
naturev -> nature
opinions -> opinion
requires -> require
theg -> the
causes -> cause
truths -> truth
selfevident -> (No suggestions)
created -> create
endowed -> (No suggestions)
rights -> right
happinessthat -> (No suggestions)
rights -> right*
governments -> government
instituted -> institute
deriving -> driving
powers -> power*
governed -> (No suggestions)
ends -> ens, end
rigvht -> right
enw -> (No suggestions)
principles -> principes, principle
organizing -> (No suggestions)
powers -> power*
governments -> government*
changed -> change
causes -> cause*
shewn -> hewn, sewn, shen
evils -> evil
ot -> t, o
abolishing -> (No suggestions)
forms -> form
abuses -> abuse
usuppations -> (No suggestions)
pursuing -> (No suggestions)
evinces -> evince
guards -> guard
futrue -> (No suggestions)
securitysuch -> (No suggestions)
has -> as, ha
colonies -> (No suggestions)
constrains -> constrain
systems -> system
presyent -> present
injuries -> (No suggestions)
usurpations -> usurpation
having -> (No suggestions)
states -> tates, state*
facts -> acts, fact
submitted -> (No suggestions)
```

Adding a cache speeds up the spell check of `brandeis_clean.txt` from about 29.62 seconds to 23.2 seconds on at least one particular computer. This is a measureable but not exactly dramatic improvement.

### Part D: Using a Set

We can do even better. When you loaded the list of properly spelled words from word_list, you probably wrote something like the following:
```python
word_list = open(input_filename).read().split('\n')
```

The variable `word_list` stores a list of strings containing each word in the word_list. To check whether a word is in the word_list, you probably used the boolean test:

```python
if test_word in word_list:
    ...
```

Unfortunately, this approach has a substantial drawback: checking whether an item is in a list using the `in` operator forces Python to check every item in the list one-by-one. `word_list.txt` contains hundreds of thousands of words, meaning that this operation is exceedingly slow.

Thankfully, we can avoid this problem by using a Python set instead. You can convert a list to a set very easily. We won't use sets much in the rest of the class, but [this StackOverflow answer](https://stackoverflow.com/a/12354550/4340151) gives a good description of the key differences between sets and lists.

```python
word_list = open(input_filename).read().split('\n')
word_set = set(word_list)
```

If you decide to use our variable naming convention, you'll have to change your boolean check to read `if test_word in word_set`.

This approach should speed up your program dramatically. Here are results from one computer:

<table>
	<tr>
		<td>File</td>
		<td>word_list</td>
		<td>Running Time (word_list as list)</td>
		<td>Running Time (word_list as set)</td>
	</tr>
	<tr>
		<td>`alice_clean.txt`</td>
		<td>`word_list.txt`</td>
		<td>14.368 seconds</td>
		<td>2.61 seconds</td>
	</tr>
	<tr>
		<td>`brandeis_clean.txt`</td>
		<td>`word_list.txt`</td>
		<td>23.2 seconds</td>
		<td>2.69 seconds</td>
	</tr>
</table>

Why is this so much faster?

In Python, there are several different ways to store data, like sets, dictionaries, and lists. The `in` operator checks if a given element exists in one of these data structures. Think of a set or a dictionary as a set of boxes, each of which is labeled with a code that tells what's inside. This trick is called a "[hash table](https://en.wikipedia.org/wiki/Hash_table)." That makes it possible to find things very quickly, no matter how many items there are. But lists are like having a set of boxes, lined up in a particular order, where to find a particular object, you have to open each box one by one to see if what you're looking for is inside. This can take more time, especially if the list is big. That's why the `in` operator is much faster for sets and dictionaries than for lists.


***

## Epilogue

You might be underwhelmed by the accuracy of your spell checker. Remember, we're not asking you to build anything that could compete with what Microsoft and Google have developed. But why is your program flagging so many obviously correctly spelled words as potential misspellings?

The biggest culprit is the word_list file we've given you. To save space, Apple has distributed a word_list file that does not include every possible grammatical variation of each word. If it had, the word_list file would have ballooned in size.

To save space, programs that use Apple's word_list are expected to know a few rules of grammar -- how to transform English words into other variations. Once again, these programs are full of heuristics, rules-of-thumb (albeit pretty precise ones) that transform word roots into other valid English words. For example, notice that Apple's word_list evidently does not realize that past-tense verbs can be formed by adding `ed` to many present-tense verbs, hence the identification of `convicted`, `arrested`, and `indicted` as misspelled.

Your program might also leave something to be desired in the way it creates lists of alternative spellings. Microsoft Word and Google Docs tend to offer shorter suggestion lists than your program, and they tend to order suggestions based on what they most think you meant to spell. In fact, production spell checkers take into account not only the misspelled word but the surrounding linguistic context, trying to use pattern matching to figure out what word you probably meant.

Even though the performance of your spell checker might seem limited, it does not operate that differently from the way production spell checkers do at their core. Think about how far you've come in about a month in this course, from knowing nothing about computer programming to being able to create a functional, useful, and user-friendly piece of software!

***

*This problem set was developed by Paul Ohm in 2018 and restructured to make it simpler in 2019 and 2020. In 2021, it was split into two problem sets. For the compressed version of the class in fall 2023, it was mostly reverted to the 2020 version. For the compressed version of this class in fall 2024, it was again simplified by demoing the stray insertion solution in lecture.* 