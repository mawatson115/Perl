#“month  dayOfWeek hour”
$string = "Jan Monday 13";		#my string to parse

%date = (				#my hash of 3 arrays
day =>   [qw (Sunday Monday Tuesday Wednesday Thursday Friday Saturday)],
month => [qw (Jan Feb Mar April May June July Aug Sept Oct Nov Dec)],
hour =>  [qw (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24)],
);

@temp = split(' ',$string);		#split the string into 3 parts, month day hour
$valid=0;				#3 temp values i use to know if the givin month day or hour is valid
$valid2=0;
$valid3=0;


foreach my $key ( keys %date )  {		#loop through my hash table
    #print "Articles in group $key are: ";
    foreach ( @{$date{$key}} )  {		#loop through each array in hash
	if ($_ eq $temp[0])			#if month is valid it changes $valid to 1
{
	$valid=1;
}
	if ($_ eq $temp[1])			#if day is valid is changes $valid2 to 1
{
	$valid2=1;
}
	if ($_ eq $temp[2])			#if hour is valid it changes $valid3 to 1
{
	$valid3=1;
}

    }#inner foreach searching array slots
}#outa foreach different keys


#only way i could get this to work, i have if statements checking if each value is valid
#and prints a response based on if all are valid or which ones arent

if ($valid==1 && $valid2==1 && $valid3==1)
{
print "VALID STRING\n";
}
elsif ($valid!=1 && $valid2==1 && $valid3==1)
{
print "Invalid Month\n";
}
elsif ($valid==1 && $valid2!=1 && $valid3==1)
{
print "Invalid Day\n";
}
elsif ($valid==1 && $valid2==1 && $valid3!=1)
{
print "Invalid hour\n";
}
elsif ($valid!=1 && $valid2!=1 && $valid3==1)
{
print "Invalid Month and Day\n";
}
elsif ($valid!=1 && $valid2==1 && $valid3!=1)
{
print "Invalid Month and Hour\n";
}
elsif ($valid==1 && $valid2!=1 && $valid3!=1)
{
print "Invalid Day and Hour\n";
}
else				#if everything in string was invalid
{
print "Invalid Month, Day and Hour\n";
}