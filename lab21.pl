#1)
@list1 = qw (1 3 5 7 9);
@list2 = qw (1 3 5 7 9);
@list3 = qw (1 3 8 2 2);
@list4 = qw (0 3 5 7 9);
@list5 = qw (1 3 5);
@list6 = qw (1 3 5 7 9 3);

print "1,2: ", compare1D(\@list1, \@list2), "\n"; # 0
print "1,3: ", compare1D(\@list1, \@list3), "\n";# -3
print "1,4: ", compare1D(\@list1, \@list4), "\n";# 1
print "1,5: ", compare1D(\@list1, \@list5), "\n";# 4
print "5,1: ", compare1D(\@list5, \@list1), "\n";# -4
print "6,1: ", compare1D(\@list6, \@list1), "\n";# 6

sub compare1D {
  my $first  = $_[0];  
  my $second = $_[1];

$size1 = $#{ $first }+1;
$size2 = $#{ $second }+1;

if ($size1 < $size2)		#this if statement is used to tell which array is bigger
{				#it sets arraysize var to the size of the larger array for loop
$arraysize = $#{ $second }+1;
}
else
{
$arraysize = $#{ $first }+1;
}

for ($i=0;$i<$arraysize;$i++)	#used a for loop, found it easier, im sure this isnt the best way to do it, but its way i got it to work.
{
if (@$first[$i] > @$second[$i])	
{
	return $i+1;
}
elsif (@$first[$i] < @$second[$i])
{
	$temp = $i +1;
	return -$temp;
}
elsif ( ! defined @$first[$i])	#used if the first array is smaller then second
{
	$temp = $i +1;
	return -$temp;
}
elsif ( ! defined @$second[$i])	#used if the second array is smaller then first
{
	return $i +1;
}
}#end for

return 0;			#if none of the if statements returned then the arrays have same values and it returns 0.
}#end sub

#2)
print "Enter the number of rows: \n";
$rows=<STDIN>;
print "Enter the number of columns: \n";
$col=<STDIN>;

#@array_2d= ( 
 # [1,2,3,4], 
  #[1, 5, 9],
  #[qw (3 4 5 6)],
#);
#push (@t,\@tt);

@array_2d;
for($i=0;




print_2d(@array_2d);





print "Enter a row: \n";	#changing values in a row, works
$row=<STDIN>;
print "Enter a value: \n";
$value=<STDIN>;

for($c=0;$c<$col;$c++)
{
$array_2d[$row][$c] = $array_2d[$row][$c] + $value;
}

print_2d(@array_2d);		#print to prove addition change

sub print_2d {			#sub 2d print function, working
foreach my $rows(@_){
   foreach my $val(@$rows){
      print "$val ";
   }
   print "\n";
}
}
