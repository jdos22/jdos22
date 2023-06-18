use v5.036;
use Modern::Perl;
use Data::Dumper;



#my @Extra_List = ["1800	IN	A	192.168.0.5,
#						1800	IN	A	192.168.0.6,
#						1800	IN	A	192.168.0.7,"];

my @Extra_List = [
	"c1.garbanet. A	192.168.25.156\n".
	"c2.garbanet. A	192.168.26.200\n"
];
my @MS_Test = ["hostname","192.168.0.200",@Extra_List];

say Dumper @MS_Test;