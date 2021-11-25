/* Definitions */
%{
int lines=1, words=0, lowercase_letters=0, uppercase_letters=0, numbers=0, special_characters=0, totals=0, size=0;
%}

/* Delimiters: These separate the definitions from the Rules and actions section */
%%

\n { lines++; words++;} /* Adds to the lines and words variables a value of 1 when one goes to a new line */
[\t ' '] words++; /* Adds a value to the words variable when one moves from one word to another (words are separated by a space) */
[A-Z] uppercase_letters++;
[a-z] lowercase_letters++;
[0-9] numbers++;
[$&+,:;=?@#|'<>.^*()%!-] special_characters++;

%%

int yywrap()
{

}

int main()
{
yyin= fopen("test.txt", "r"); /* Open the 'test.txt' file in a read only fomart */
yylex();
totals= special_characters + numbers + uppercase_letters + lowercase_letters;
size = (totals * 1); /* The total size in bytes is equal to the total number of characters multiplied by one byte since each is one byte */

/* Prints the output */
printf("This file contains the following:");
printf("\n\t%d lines", lines);
printf("\n\t%d words", words);
printf("\n\t%d Lowercase letters", lowercase_letters);
printf("\n\t%d Uppercase letters", uppercase_letters);
printf("\n\t%d digits", numbers);
printf("\n\t%d special characters\n\n", special_characters);
printf("\n\t The total size of the file characters in bytes is: %d bytes.\n", size);
}