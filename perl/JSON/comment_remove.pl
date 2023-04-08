use Modern::Perl;

# Purpose:
# Get rid of // style comments from kea configuration.
# because the JSON handler doesn't do it.

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