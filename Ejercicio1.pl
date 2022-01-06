use strict;
use warnings;

sub normalize
{
    my ($String)=@_;

    my $LowerCaseString= lc($String);

    $LowerCaseString=~ s/\s//g; #Eliminar espacios

    return $LowerCaseString;

}


sub IsPalindrome
{
    my ($String)=@_;

    my $NormalizedString=normalize($String);

    my $ReversedString= reverse $NormalizedString;
    
    if ($NormalizedString eq $ReversedString)
    {
        return 1;
    }

    return 0;
}
