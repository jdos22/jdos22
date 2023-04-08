use Modern::Perl;
use Regexp::Common qw/comment/;

# Purpose:
# Get rid of // style comments from kea configuration.
# because the JSON handler doesn't do it.
# Going to try to use regexp::Common::Comment.
# The following regexes are what I think are appropriate:
# /$RE{comment}{C}/
# /$RE{comment}{C++}/
# /$RE{commont}{shell}/
# So remember that the comments that are hard are not the single line comments
# but the ones ot the end of the line. Or maybe worse - the ones between 
# delimiters
# apparently, the ONLY Regexp::Common::Comment that works is the "C" style,
# but that was the hard one, so fine.


while (<DATA>) {
	chomp;
	my $changed = $_;
	$changed =~ s/#.*$//g;
	$changed =~ s/$RE{comment}{C}//;
	$changed =~ s/\/\/.*$//g;
	chomp $changed;
	if ($changed) { say $changed }

}

__DATA__
// Shouldn't see. Double slashes.
# Shouldn't see. Octothorpe.
/* shouldn't see. C style. */
Should see this. #Shouldn't see this.