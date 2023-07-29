#!/usr/bin/env perl

# Dereferencing has become very important as I work with different data
# structures. I've found that there are some subtle differences in the way
# that the dereferencing is handled and I'd like to get a better handle on 
# exactly how I *should* be doing things.
use Modern::Perl;
use Data::Dumper;

my %Array;
$Array{"first"} = [ "First Element", "Second Element"];

say Dumper %Array;