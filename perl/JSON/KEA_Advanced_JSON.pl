use Modern::Perl;

use JSON5;
use Data::Dumper;

# Okay. We're going to slurp the KEA configuration file, then
# Convert it, then pretty print it.

# Here's the open. Note the block used to isolate the local statement.
my $FD_JSON;
{
	open (my $FH,'<',"./advanced.json");
	local $/;
	$FD_JSON = <$FH>;
	close $FH;
}
my $KEA_JSON = JSON5->new;
my $My_Refs = $KEA_JSON->decode($FD_JSON);
say Dumper $My_Refs;
