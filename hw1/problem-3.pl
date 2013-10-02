@list =qw (1 23 431 123 43 123 645 43);	#2 lists for testing to making sure it took in more then 1 param.
@list2 =qw (1 12 23 34 45);


$found = search (45, @list, @list2);	#puts the return value in found for printing and testing.

sub search {
my ($y, @z) = (@_);	#im not sure if this is how you wanted it done, but as you said it worked no
foreach $z (@z){	#matter how many lists i added, it flatted them all and into 1 list called z
 if ($y == $z)
{
	return 1;
}
}#end foreach
return 0;	#outside of the foreach loop, if the loop didnt return 1 then it defaults to 0
}#end sub

print "$found\n";		#testing print