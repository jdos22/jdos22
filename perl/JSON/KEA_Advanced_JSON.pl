use Modern::Perl;

use JSON;
use Data::Dumper;
use Regexp::Common qw/comment/;

# Okay. We're going to slurp the KEA configuration file, then
# Convert it, then pretty print it.

# Here's the open. Note the block used to isolate the local statement.
my $FD_JSON;
my $FD_Flat;
{
	open (my $FH,'<',"./advanced.json");
	my @FD_Lines;
	foreach (<$FH>) {
		chomp;
		my $changed = $_;
		$changed =~ s/#.*$//g;
		$changed =~ s/\/\/.*$//g;
		push @FD_Lines, $changed;
	}
	$FD_Flat = join ('',@FD_Lines);
	$FD_Flat =~ s/$RE{comment}{C}//g;
	seek $FH,0,0;
	local $/;
	$FD_JSON = <$FH>;
}

my $My_Refs = decode_json($FD_Flat);
say to_json ($My_Refs,{pretty=>1});
