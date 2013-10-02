#1)
@days = qw (Monday Sunday Saturday Friday Tuesday Wednesday Thursday);

%daysofweek = (
Sunday => 1,
Monday => 2,
Tuesday => 3,
Wednesday => 4,
Thursday => 5,
Friday => 6,
Saturday => 7,
);

print "@days\n";
@days = sort byCardinal @days;
print "@days\n";


#wow i was way over thinking on how to do this, thank you for the email, 
#after i read your email i fiqured it out in less then 5minutes haha.

sub byCardinal {
  if ($daysofweek{$a} < $daysofweek{$b}) {
	return -1;
  }
  elsif ($daysofweek{$a} > $daysofweek{$b}) {
	return 1;
  }
  return 0;	
}


#2)

@dates = qw (3-15-2004 3-16-2004 3-14-2004 3-14-2005 3-14-2003 4-14-2004 2-14-2004);
print "@dates\n";	#original array unsorted


@dates = sort { join('', (split '-', $a)[2,0,1]) cmp join('', (split '-', $b)[2,0,1]) } @dates;
print "@dates\n";	#new array sorted by years then months then days
