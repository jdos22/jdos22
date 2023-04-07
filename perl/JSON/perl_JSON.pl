use warnings;
use strict;
use 5.036;
use Data::Dumper;

# File to play with JSON in perl.
# This will be useful for the practice, but too, to parse the in/out
# of IB.

use JSON;

# JSON like hash or array references. Let's try that.

my $Hash_Ref = {first_element => "First!",
					second_element => "Second!"};
my $json = JSON->new->allow_nonref;
					
my $Encoded = encode_json ($Hash_Ref);

say Dumper $Encoded;
say "And now pretty printed:";
say $json->pretty->encode ($Hash_Ref);