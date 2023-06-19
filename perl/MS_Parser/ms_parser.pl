use v5.036;
use Modern::Perl;
use Data::Dumper;



#my @Extra_List = ["1800	IN	A	192.168.0.5,
#						1800	IN	A	192.168.0.6,
#						1800	IN	A	192.168.0.7,"];

my @Extra_List = [
	"c1.garbanet. A	192.168.25.156\n".
	"c2.garbanet. A	192.168.26.200\n".
	"Garbage.net. A NotIP192.168.26.201\n"
];
my @MS_Test = ["hostname","192.168.0.200",@Extra_List];

say $MS_Test[0]->[2]->[0];
my @Big_List = split '\n',$MS_Test[0]->[2]->[0];

foreach my $Line (@Big_List) {
	say "Begnning";
	say $Line;
	say "End";
	my @Elements = split ' ',$Line;
	say join ' --- ',@Elements;
	my $RE = qr/^(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))\.(\d|[1-9]\d|1\d\d|2([0-4]\d|5[0-5]))$/;
	if (($Elements[1] eq 'A') and ($Elements[2]=~ $RE )) {
		say "Found A record with a passable IP.";
	}
}