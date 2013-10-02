@list =qw (1 45 431 123 43 45 645 43);		#2 lists for testing to making sure it took in more then 1 param.
@list2 =qw (1 12 45 34 45);

searchLocation (45, @list, @list2);		#calls searchlocation using 45 and 2 lists for testing




sub searchLocation {
my ($y, @z) = (@_);				#sets our search value as y, and everything else into 1 list z

return (@index = grep { $z[$_] eq $y } 0..$#z);	#uses grep to search our list z for our value y
						# if $z[$_] eq $y comes back true then it adds the index 
						# using 0..$#z to the array of indexs

}#end sub


print "I found the number at these Indexs : @index\n";   #testing print