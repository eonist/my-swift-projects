//add some ideas from here http://cdn5.raywenderlich.com/downloads/RW-NSRegularExpression-Cheatsheet.pdf
// combine with your own

**Special Characters Operators**

* 0 or more times. Match as many times as possible.
+ 1 or more times. Match as many times as possible.
? 0 or 1 times. Prefer 1.
*? 0 or more times. Match as few times as possible.
+? 1 or more times. Match as few times as possible.
?? 0 or 1 times. Prefer 0.
*+ 0 or more times. Match as many times as possible when first encountered, do not retry with fewer even if overall match fails (Possessive Match).
++ 1 or more times. Possessive match.
?+ 0 or 1 times. Possessive match.
{n} {n}? {n}+ Exactly n times.
{n,} n or more.
{n,}? At least n times, but no more than required for an overall pattern match.
{n,m} Between n and m times.
{n,m}? Between n and m times. Match as few times as possible, but not less than n.

**Anchors**
^ Beginning of a line.
$ End of a line.
\A Beginning of an input. Doesn’t match after a new line within the input.
\z End of input.
\Z End of input, but before the final line terminator, if one exists.
. Any character.
\ Quote (escape) following character.
