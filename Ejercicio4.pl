use strict;
use warnings;

sub FileReader
{
    my ($FileName)=@_;
    my $StringToReturn="";
    
    open(my $File,  "<",  $FileName) or die "Can't open $FileName: $!";

    while (<$File>)
    {
        $StringToReturn=$StringToReturn . $_;
    }
    close ($File);

    return $StringToReturn;
}

sub FileModifier
{
    my ($FileName,$TextToSave)=@_;
    
    open(my $File, ">",  $FileName) or die "Can't open $FileName: $!";

    print $File $TextToSave;

    close ($File);

}


sub cifrar
{
    my ($Text)=@_;

    my $DictLowercasse="abcdefghijklmnopqrstuvwxyz";
    my $DictUppercasse="ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    my $CharacterPosition=undef;
    my $TextOut="";
    my $Character;
    my $Dictionary="";

    for (my $i=0;$i<length($Text);$i++)
    {
        $Character=substr($Text,$i,1);

        if($Character=~/[A-Za-z]/)
        {
            if($Character=~/[a-z]/)
            {
                $Dictionary=$DictLowercasse;
            }
            elsif($Character=~/[A-Z]/)
            {
                $Dictionary=$DictUppercasse;
            }
            $CharacterPosition= index($Dictionary,$Character)+13; #Movimiento de 13 posiciones dentro del diccionario
        
            $CharacterPosition=$CharacterPosition%26; #Oscila dentro de las 26 posiciones del diccionario

            $TextOut=$TextOut . substr($Dictionary,$CharacterPosition,1); 
        }
        else
        {
            $TextOut=$TextOut . $Character
        }

    }

    return $TextOut;
}


sub main
{
    my $FileName=$ARGV[0];
    my $Argument2=$ARGV[1];

    my $Text=FileReader($FileName);

    if($Argument2=~"cifrar")
    {
        my $TextToSave=cifrar($Text);

        FileModifier($FileName,$TextToSave);
    }
    elsif($Argument2=~"descifrar")
    {
        my $TextToSave=cifrar($Text); #La funcion de cifrado de ROT13 es su propia inversa (descifrado).

        FileModifier($FileName,$TextToSave);
    }
    else
    {
        print "No se ingreso accion a realizar (cifrar/descifrar)";
        return;
    }
}

main();