open (IN, "num2.txt") or die "Can't open input.txt\n";
chop (@array=<IN>);
close IN;

%hash=(		#hash to keep track of cities and people in tem
);

%count;		#hash to keep count how many times a city is listed

foreach $array (@array)	#only 1 loop through array
{

@temp = split(' ',$array);	#spliiting each element in array into 2 parts, city and count in that city
$count{$temp[1]}++;		#adds city to count hash or adds 1 to value if already in it, basicly city counter
if (exists $hash{$temp[1]})	#if the city already exists in my city hash then it adds the people
{
	$hash{$temp[1]} = $hash{$temp[1]} + $temp[2];
	
} else {			#else it adds the city to city hash
	$hash{$temp[1]} = $temp[2];
}
}#end foreach array loop

foreach $key (sort (keys(%hash))) {		#loop to sort by name alpbet and print

 if($count{$key}>1)				#extra creidt, couldnt get them to line up though
{
   print "$key: $hash{$key}  people in $count{$key} households\n";
} else {
print "$key: $hash{$key}  people in $count{$key} household\n";
}
}



