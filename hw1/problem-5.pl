use List::Util qw(min max);		#needed to use the min and max functions perl has built in, i found them really handy for this problem

@words = qw (HELLO goodbye hello this is a test this is another test of a another hello);


%num = ();				#an empty hash table, to map the count of each word

@low = ();				#an empty array to put all the smallest words in for printing later
@high = ();				#an empty array to put all the biggest words in for printing later

foreach $word(@words) {			#puts the word as the key and the count as the value.
$word = lc $word;			#so upper or lower case doesnt matter, it counts the word no matter
$num{$word} ++;				#adds the word to the hash and incriments its value by 1 for each time its found
}

$least = min(values %num);		#gives me my smallest count of a word, basicly min value in the hash table
$largest = max(values %num);		#gives me my largest count of a word, basicly the max value in the in hash table



foreach $key(keys %num) {		#this entire loop is used to push the words used least on a low array and words used most on a high array
					#i use these 2 arrays so i can print out the words if there is a tie.
if ($num{$key} == $least)
{
push (@low, "$key,")
}
elsif ($num{$key} == $largest)
{
push (@high, "$key,")
}

}

$arraySize = @high;				#to know size of high array for printing if
$arraySize2 = @low;				#to know size of low array for printing if


if ($arraySize == 1)				#if statement to fix grammer if most has more then 1
{
print "Most frequent word is @high occurring $largest times\n";
}
else
{
print "Most frequent words are @high they occur $largest times\n";
}


if ($arraySize2 == 1)				#if statement to fix grammer if least has more then 1
{
print "Least frequent word is @low occurring $least time\n";
}
else
{
print "Least frequent words are: @low they occur $least time\n";
}