# cheers_take2
The ruby cheers exercise (see: MatthewReuther/cheers), this time 3 weeks into learning Ruby, with tests!


## Instructions
(What is the class supposed to do)


## Specifications
(How does the program work)

Start the program by running `./cheers.rb`

The program should ask:

> Hello! What is your name?

The user types in their name, for example:

> Abby

The program outputs a cheer in the following format:

> Give me an... A
> Give me a... B
> Give me a... B
> Give me a... Y
> Abby’s just GRAND!

* Follow the proper grammatical for a and an. The rule is based on whether the spelling of a letter would begin with a vowel.
* Ignore all special characters (i.e. non-word characters) when printing the cheer (e.g. "Give me a...")
* Print the user's name out as it was originally input for the "just GRAND" line
* If there was no input, ask again until valid input is provided

After printing out the user's cheer, the program asks:

> Hey, Abby, what's your birthday? (mm/dd)

The user types in their birthdate

> 08/25

* If there was no input, asks again until valid input is provided
* If there was input that couldn't be parsed, the program tries again, but with the prompt:

> I couldn't understand that. Could you give that to me in mm/dd format?

The program then outputs the number of days until the user's birthday

> Awesome!  Your birthday is in 45 days! Happy Birthday in advance!

