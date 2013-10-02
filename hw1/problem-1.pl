
#not sure if you wanted us to provide the array so i did anyways

@months = qw (JanuarY February MARCH April MAy June July August SeptEMber October November December);
print "@months\n";


%daysinmonths = (   #my hash using months in all uppercase for the UC function, mapping them to days in month
JANUARY => 31, 
FEBRUARY => 28,
MARCH => 31,
APRIL => 30, 
MAY => 31,
JUNE => 30,
JULY => 31,
AUGUST => 31,
SEPTEMBER => 30,
OCTOBER => 31,
NOVEMBER => 30,
DECEMBER=> 31,
);


foreach $months (@months) {	#loop through the months array
	$upper=uc $months;  	#turns each month no matter the cap into all caps for hash table
  if (exists $daysinmonths{$upper}) {	#if it finds it in the hash table
      $months = $daysinmonths{$upper};	#it replaces the name with the number of days
  }
}

print "@months\n";