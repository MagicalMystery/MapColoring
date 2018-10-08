print "\ncomparing file $ARGV[0] and $ARGV[1]\n";

open FILE, "$ARGV[0]" or die $!;

@file1=<FILE>;
open FILE, "$ARGV[1]" or die $!;
@file2=<FILE>;

$count=0;
while(1)
{

	($x1)=$file1[$count]=~/^(.*?)$/is;
	($x2)=$file2[$count]=~/^(.*?)$/is;
	# print $x1,$x2;
	# print $file1[$count];
	if($x1!=$x2)
	{
		print "!!Line $count doesn't match\n";
		last;
	}
	if(!$file1[$count] || !$file2[$count])
	{
		print "!!Compared $count lines\n";
		last;
	}
	$count++;

}

print scalar @file1," lines in $ARGV[0],$file2)",scalar @file2," lines in $ARGV[1]\n"; 