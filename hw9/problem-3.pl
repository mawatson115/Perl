@grade_book= (
"User Name, First, Last, HW1, HW2, HW3, PROJECT2, PROJECT3,",
"gunderwood,Gary,Underwood,90,88,70,,92,",
"fworthy,Fred,Worthy,80,90,70,,81,",
"vsessions,Valerie,Sessions,75,85,75,,92,",
"ylin,Joseph,Lin,70,80,90,,99,",
"jroberts,James,Roberts,75,81,95,,78,",
);

@ggtemp = split(',',$grade_book[0]);			#all this is to get the index of Project2, not sure if its the best way but its how i did it
my $search_for = " PROJECT2";
my( $pro2index )= grep { $ggtemp[$_] eq $search_for } 0..$#ggtemp;


@firstrow = shift @grade_book;					#to get rid of title row and store it in firstrow array

@project2=(		
"vsessions,5",
"fworthy,82",
"gunderwood,100",
"jroberts,80",
"sperrine,30",		#yes this is on purpose
);

%pro2;		#used to turn project2 array into a hash table
@nosubmit;	#to store who didnt submit project2


foreach $project2 (@project2)	#turns project 2 into a hash table
{
@temp=split(',',$project2);
$pro2{$temp[0]} = $temp[1];
}


foreach $grade (@grade_book)
{
@gtemp = split(',',$grade);	#splitting each persons gradebook into 8 element array

while ( my ($key, $value) = each(%pro2) ) 
{	
	push(@keylist, $key);
        if($key eq $gtemp[0])
	{
	$gtemp[$pro2index]=$pro2{$key};		#inserts the project 2 grade into gradebook, if the name is in the gradebook
	}

}#end while


if($gtemp[$pro2index]=='')		#if the value in the project slot doesnt change, then they didnt submit it and there name gets pushed into a nosubmit array
{
push(@nosubmit,$gtemp[0] );
}


$grade=join(',', @gtemp); 		#puts the split back together, as 1 array element for printing
}#end foreach gradebook

print "@firstrow";
print "@grade_book\n";
print "The following students did not submit PROJECT2:  @nosubmit";

#print "The following students were not found in the grade book:  @nogradebook";
#couldnt get the 2nd check to work, i tried alot of different ways but never got the if they were not found in grade book to work
