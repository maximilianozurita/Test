use strict;
use warnings;

sub Validation
{
    my ($Base,$Number1,$Number2)=@_;

    #Validacion de base
    if($Base<2 || $Base>25)
    {
        print "Error: La base ingresada en el argumento 1 debe estar en el rango de 2 a 25";
        return 0;
    }

    #Validacion de simbolos:
    if($Number1=~ /[\-~\@;:\^_¿'¡?!°#%&()=|]/ || $Number2=~ /[\-~\@;:\^_¿'¡?!°#%&()=|]/ || $Base=~ /[\-~\@;:\^_¿'¡?!°#%&()=|]/)
    {
        print "Error: caracter no valido";
        return 0;
    }

    #Validacion números decimales
    if($Number1=~/[.]/ || $Number2=~/[.]/)
    {
        print "Error: Ingrese un numero entero";
        return 0;
    }

    if (BaseValidation($Base,$Number1)==0 || BaseValidation($Base,$Number2)==0)
    {
        return 0
    }

    return 1;
}


sub BaseValidation
{
    my ($Base,$Number)=@_;
    my $Values="0123456789abcdefghijklmno";
    my $ValidValues=substr($Values,0,$Base);
    my @NumberArray=split("",$Number);

    foreach my $item(@NumberArray)
    {
        if($ValidValues!~lc($item))
        {
            print "Error: El caracter '$item' excede al rango de valores establecido en la base";
            return 0;
        }
    }

    return 1;
}




sub NumberNormalize
{
    my ($item)=@_;
    my $itemToReturn;

    my $Dictionary="abcdefghijklmno";

    my $lcItem=lc($item);

    $itemToReturn=index($Dictionary,$lcItem);
    
    if($itemToReturn==-1)
    {
        $itemToReturn=$lcItem; #Valores de 0 al 9
    }
    else
    {
        $itemToReturn+=10; #Valores del 10 al 24
    }

    return $itemToReturn;
}




sub LetterNormalize
{
    my ($item)=@_;
    my $itemToReturn;

    my $Dictionary="abcdefghijklmno";
    if($item>=10 && $item<=25)
    {
        $itemToReturn=substr($Dictionary,$item-10,1);
    }
    else
    {
        $itemToReturn=$item;
    }
    
    return $itemToReturn;
}




sub ToDecimal
{
    my ($Base,$Number)=@_;

    my @NumberArray=split("",$Number);

    my $decimal=0;
    my $NumberNormalized;
    my $i=@NumberArray-1;
    foreach my $item(@NumberArray)
    {

        $NumberNormalized=NumberNormalize($item);

        $Decimal+=$NumberNormalized*($Base**$i);

        $i--;
    }

    return $Decimal;
}




sub ToBase
{
    my ($Base,$Number)=@_;

    my $Remaind=undef;
    my $String="";

    #Metodo división por la base
    while ($Number>=$Base)
    {
        $Remaind=$Number%$Base;

        $Remaind=LetterNormalize($Remaind); #Normalizar a letras si es necesario

        $String=$String . $Remaind;

        $Number=int($Number/$Base);
    }
    $String=$String . LetterNormalize($Number);

    my $Result= reverse $String;


    return $Result;
}




sub sumar
{
    my ($Base,$Number1,$Number2)=@_;

    if(Validation($Base,$Number1,$Number2)==0)
    {
        exit;
    };

    my $DecimalNumber1= ToDecimal($Base,$Number1);
    my $DecimalNumber2= ToDecimal($Base,$Number2);

    my $Sum=$DecimalNumber1+$DecimalNumber2;

    my $Result=ToBase($Base, $Sum);

    return $Result;
}