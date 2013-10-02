#4 hash tables for differnt forms of the digit and postfix
%singledigit = (
  0 => ' ', 1 => 'one', 2 => 'two',   3 => 'three', 4 => 'four',
  5 => 'five', 6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine',
);

%pluralword = (
  0 => ' ', 1 => 'ten', 2 => 'twenty',   3 => 'thirty', 4 => 'fourty',
  5 => 'fifty', 6 => 'sixty', 7 => 'seventy', 8 => 'eighty', 9 => 'ninety',
);

%tenlist = (
  0 => 'ten', 1 => 'eleven', 2 => 'twelve',   3 => 'thirteen', 4 => 'fourteen',
  5 => 'fifteen', 6 => 'sixteen', 7 => 'seventeen', 8 => 'eighteen', 9 => 'nineteen',
);

%postfix = (
  0 => '', 1 => '', 2 => '',   3 => 'hundred', 4 => 'thousand',
  5 => 'thousand', 6 => 'hundred thousand', 7 => 'million', 8 => 'million', 9 => 'hundred million',
);

#command line arg stuff
if ($#ARGV==0){
print "converted to word format: ".numtoword($ARGV[0])."\n";	#calls our funtion to convert
$temp=0;		#temp variable i use for the tenlist hash
}else{
print "You did not give me 1 command line argument \n";
}

sub numtoword {	
  my $num = shift;		#these 3 lines are used to put differnt digit in each array slot
  my $txt = "";  		#empty string to add to for return
  my @val = $num =~ m/./g;

if ($val[0] == '-')
{
$txt .="negative ";
shift @val;
} 
my $mylength = $#val + 1;	#used to tell me how many digits the number is

foreach my $digit (@val) { 
#as the spec says this assumes a 4digit number, i attempted to get it to
#work for larger then 4 digits, and i prob could but only with many many if statements
#if it enters any of my if statements it reduces the word count by 1

if($mylength > 2 && $digit == 0)  #for when we have larger then hundred number and 0 hundreds
{
$txt .= "";
$mylength-=1;
}
elsif($mylength == 2 && $digit == 1) #for teens it skips this loop
{
$temp = 1;		#sets our temp value so we know to call teen hash in last slot of array
$mylength-=1;
}
elsif($mylength == 2)
{
$txt .= $pluralword{$digit} . " "; #calls my plural word hash
$mylength-=1;
}
elsif($mylength == 1)
{
if($temp == 1)		#if for that special temp value for teens
{
$txt .= $tenlist{$digit} . " ";		#calls teen hash
}else{

    $txt .= $singledigit{$digit} . " ";	#calls single digit hash
}
}
else{	#if its over 2 digits it does this
$txt .= $singledigit{$digit} . " $postfix{$mylength} ";
$mylength-=1;
}
  }

  return $txt;		#returns my final string for printing
}