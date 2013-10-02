#Create an associative array with keys being names and values being ID numbers.  Make up some data values.


%hash= (
  'Mark', 144972,
  'Bob', 222111,
  'Joe', 888777,
  'Harry', 552244,	
);

#Create code that loops through the array printing out lines of the form 
#"The id number of name is ID" with appropriate values for name and ID.
@keysList = keys %hash;
foreach $key (@keysList) {
  print "The id number of $key is $hash{$key}\n";
}

#Create an array of names called @students that contains various names in random order from your 
#associative array.  It should include names not present in the hash.

@students = qw (Mark Bob Joe John Bill Adam);

#Create code that loops through students and REPLACES the name with their ID.  
#If the name is not present in the hash, replace it with "name is invalid"

foreach $students (@students) {

foreach $key (@keysList) {

$true = $key eq $students;
$temp=0;

if ($true == 1)
{
	$students=$hash{$key};
	$temp=1;
	last;
} 
}#end foreach inside

if ($temp==0)
{
$students="name is invalid";
}

}#end foreach out




#Then loop through and print all the values in the array, 1 per line.
foreach $students (@students) {
print "$students\n";
}