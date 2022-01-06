use strict;
use warnings;


sub toNumber
{
    my ($Number)=@_;

    my @ArrayNumber=split("",$Number);

    my $IntegerNumber="";
    my $DecimalNumber="0";
    my $Expression="";

    my $Flag=0;
    my $MaxDecimal=0;
    
    my $i=0;
    foreach my $item(@ArrayNumber)
    {
        if($item=~/[0-9]/)
        {

            if($Flag==0)
            {
                $IntegerNumber= $IntegerNumber . $item;
            }
            elsif($Flag==1 && $MaxDecimal<=2)
            {
                $DecimalNumber=$DecimalNumber . $item;
                $MaxDecimal++;
            }    

        }
        elsif($Expression eq ""  && @ArrayNumber>4)
        {
            $Expression=$item;
        }
        elsif($item ne $Expression || @ArrayNumber<=4)
        {   
            $DecimalNumber=$DecimalNumber . ".";
            $Flag=1;
        }
        $i++;
    }
    

    return $IntegerNumber+$DecimalNumber; #Suma->Conversión de string a número
}