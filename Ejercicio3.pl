use strict;
use warnings;
use LWP::Simple;
use JSON;

sub temp
{
    my ($city)=@_;
    my $tempToReturn=undef;


    my $apiKey="c3f6ad603660e302f4e2a3f81cc1fa6f";
    my $url=undef;

    if($city=~/[A-Za-z]/)
    {
        $url="https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";
    }
    elsif($city=~/[0-9]/)
    {
        $url="https://api.openweathermap.org/data/2.5/weather?id=$city&appid=$apiKey";
    }

    my $jsonContent=LWP::Simple::get($url)||die("ocurrio un en la conexion o no se encontro ciudad '$city', vuelva a ingresar o intente mas tarde");

    my $jsonDecoded=decode_json($jsonContent);

    my $temp = $jsonDecoded->{'main'}->{'temp'} - 273.15;

    $tempToReturn= sprintf("%.2f", $temp); #3 Decimales

    return $tempToReturn;
}

sub main
{
    my $city1=$ARGV[0];
    my $city2=$ARGV[1];

    my $temp1=temp($city1);
    my $temp2=temp($city2);

    if($temp1>$temp2)
    {
        print "en $city1($temp1 °C) hace mas calor que en $city2($temp1 °C)";
    }
    elsif($temp1<$temp2)
    {
        print "en $city2($temp2 °C) hace mas calor que en $city1($temp1 °C)";
    }
     else
    {
        print "Ambas ciudades tienen la misma temperatura ($temp1)";
    }

}

main();

