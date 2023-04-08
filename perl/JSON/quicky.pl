use Regexp::Common qw{ comment };
print( $RE{ comment }{ Perl }, "\n" );
"" =~ m{ $RE{ comment }{ Perl } }x;
