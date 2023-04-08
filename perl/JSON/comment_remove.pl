use Modern::Perl;
use Regexp::Common;

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


while (<DATA>) {
	chomp;
	say;
	s/([\s\S]*?)(?=#)/$1/ && print;
	s/([\s\S]*?)(?=\/\/)/$1/ && print;
}

__DATA__
This is a line that should parse correctly. Should just print.
This is a line with a comment. \\ that's all that should print.
This is a line with a shell style comment. # shouldn't see it.