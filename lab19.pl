#1)Create an array of strings with values being names of the form "First Last".  Sort the array by LAST name.

@names = ("Mark Watson","Gary Underwood","Nick Roads", "Jessica Alba", "Phillip Defranco");  #test values

@names = sort byLast @names;			#calls byLast name function to sort
print "@names\n\n";				#prints sorted list by last name

sub byLast{
    (split " ", $a)[1] cmp (split " ", $b)[1]  #splits the word at the space and sorts the last names only
}



#2)Write a pattern to match SSNs in the form 123-45-6789, so it has to be 3 digits-2digits-4digits

@ssn = qw (123-23-2345 222-33-4354 12-23-1234 432-1-2134 531-12-123 534-87-2398);  #some test values, some dont match
print "@ssn\n";					#test print to see before
@validssn = ();					#empty array to hold valid ssn's
	
foreach $ssn(@ssn)				#loop to go though array
{
if ($ssn =~ m#\d{3}-?\d{2}-?\d{4}#)		#if it finds a match of 3digit-2didgit-4digit
{
push(@validssn, $ssn);				#pushs it on validssn array
}

}
print "@validssn\n\n";				#prints just valid ssn's after matching





#3)Write a pattern to match SSNs in the form 123-45-6789 or 123/45/6789 but not 123/45-6789

@ssn2 = qw (523-73-4567 123/56/8932 233/34-5534 );	#3 test values 1 is wrong
print "@ssn2\n";					#test print to see before
@validssn2 = ();					#empty array to hold valid ssn's



foreach $ssn2(@ssn2)				#loop to go though array
{
if ($ssn2 =~ m#\d{3}-?\d{2}-?\d{4}#)		#if it finds a match of 3digit-2didgit-4digit using -
{
push(@validssn2, $ssn2);				#pushs it on validssn2 array
}

elsif ($ssn2 =~ m#\d{3}\/?\d{2}\/?\d{4}#)		#if it finds a match of 3digit-2didgit-4digit using /
{
push(@validssn2, $ssn2);				#pushs it on validssn2 array
}

}
print "@validssn2\n\n";				#prints just valid ssn's after matching



#4)Pattern to match floating point numbers such as:  3.5  -3 -.5 234.1313241

@nums = qw (1 4 5 7 3.5 -3 -.5 234.1313241);	#test array
print "@nums\n";					#test print before
@floating = ();					#empty array to hold floating point numbers

foreach $nums(@nums)				#loop array
{
if ($nums =~ m#[-+]([0-9]*\.[0-9]+|[0-9]+)#)	#if it finds a match using  - as floating
{
push(@floating, $nums);				#pushs it on floating array
}
elsif ($nums =~ m#([0-9]\.[0-9])#)		#if it finds a match using .as floating
{
push(@floating, $nums);				#pushs it on floating array
}


}#end foreach
print "@floating\n\n";				#test printing on floating point numbers


#5)Pattern to match dates of the form Jan 3, 2004 using 3 character month names

@dates = ("Jan 3, 2004", "January 6, 2003","Feb 3, 2004","Feburary 18, 2001","Jan 3, 2099","Jan 32, 2004");	#test data
print "@dates\n";

@match = ();	#empty array to hold matchs
foreach $dates(@dates)				#loop array
{

if ($dates =~ m#\w{3}\s\d{1,2}\,\s\d{4}#i)	#if it finds a match using  3 letter month
{
push(@match, $dates);				#pushs it on match array
}



}#end foreach
print "@match\n\n";














