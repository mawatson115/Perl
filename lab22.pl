print "Give me a string: \n";
$input=<STDIN>;

#Create code using patterns to count how many times the letter 'g' appears in the string
my $count = $input =~ tr/g/g/;		 	
print "There are $count g's in the string.\n";

#how many integers (not digits, but full integers) it has and print those counts.
while ($input =~ /\d+/g) { $count2++ }
print "There are $count2 integers in the string\n";

#Now count the number of times there is a word (letters only) followed by space(s) followed by an integer and print the count.
while ($input =~ /\D+\s+\d+/g) { $count3++ }
print "There are $count3 patterns of words followed by space followed by an interger\n";

#Create an array that has a list of all the integers and print the array.
@numarray;
push(@numarray, $input =~ /\d+/g);
print "@numarray\n";