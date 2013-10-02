@dates = qw (2/29/12 11/21/2006 11/01/06 13/01/06 4/31/06);

print "@dates\n";		#print before

%months = (			#used to change number month to word month
1 => Jan,
2 => Feb,
3 => Mar,
4 => April,
5 => May,
6 => June,
7 => July,
8 => Aug,
9 => Sept,
10 => Oct,
11 => Nov,
12 => Dec,
);

%daysinmonths = (		#used to check if day in month is valid
Jan => 31, 
Feb => 28,
Mar => 31,
April => 30, 
May => 31,
June => 30,
July => 31,
Aug => 31,
Sept => 30,
Oct => 31,
Nov => 30,
Dec=> 31,
);


foreach $date (@dates)			#loop so we can do it to each date
{
@temp = split('/', $date);		#split the date into 3 elements in an array

if($temp[2]%4==0)			#check for leap year
{
$daysinmonths{Feb}=29;
}
if($temp[0] == 1 | $temp[0] == 2 | $temp[0] == 3 | $temp[0] == 4 | $temp[0] == 5 | $temp[0] == 6 | $temp[0] == 7 | $temp[0] == 8 | $temp[0] == 9 | $temp[0] == 10 | $temp[0] == 11 | $temp[0] == 12) #cant be best way but only way i could get it to work
{
	
	$temp[0] = $months{$temp[0]};	#changes the number month to word using my hash
	if ($temp[1] > $daysinmonths{$temp[0]})	#check if the day is valid for month
	{
		$temp[0]="Error $temp[1] is not a valid day for $temp[0]";
		$temp[1]="";
		$temp[2]="";	
	}
	$temp[1]="$temp[1],";		#to add comma after day, formatting
	if (length($temp[2]) == 2)	#to check for 2 or 4 digit year and put 2digit to 4digit
	{
		$temp[2]="20$temp[2]";
	}
}
else
{
$temp[0]="Error $temp[0] is not a valid month";		#first check, if month is invalid it skips first if statement
$temp[1]="";
$temp[2]="";
}
$date=join(' ', @temp);		#join them back together at very end
}#end dates foreach

print "@dates\n";		#print after
