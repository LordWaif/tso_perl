#!/usr/bin/perl
use strict;
use warnings;
use utf8;

use Data::Dumper;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;

open(ARQ, "poesias_machado_de_assis.txt");
my $count = 0;
my $dados = "";
while (my $linha = <ARQ>){
    $dados = $dados.$linha;
}

my @registro1 = ($dados =~ /\r\n\r\n.+\r\n\r\n\r\n/gm);
my $length1 = @registro1;
$length1 += 1;
print "Número total de poemas: $length1\n";

my @registro2 = ($dados =~ /.+\r\n(?!\r\n\r\n[^\r])/gm);
my @registro21 = ($dados =~ /(?!.+\r\n).*/gs);
my $length21 = @registro2;
@registro2 = (@registro2,$registro21[0]);
my $length2 = @registro2;
print "Número total de versos: $length2\n";

my @registro3 = ($dados =~ /(.+\r\n){2,}/gm);
my $length3 = @registro3;
$length3 = $length3;
print "Número total de estrofes: $length3\n";

my @registro4 = ($dados =~ /^\r\n(.+\r\n){6}\r\n/gm);
my $length4 = @registro4;
print "Numero de estrofes sextilha: $length4\n";

my @registro5 = ($dados =~ /^(\r\n){2}(.+\r\n){4}\r\n(.+\r\n){4}\r\n(.+\r\n){3}\r\n(.+\r\n){3}(\r\n){2}/gm);
my $length5 = @registro5;
$length5 = $length5/6;
print "Número de sonetos: $length5\n";

my $sum2 = 0;
foreach my $linha (@registro2) {
    my $length = length $linha;
    $sum2 += $length;
}
my $media2 = 0;
$media2 = $sum2/$length2;
print "\nTamanho médio dos versos: $media2\n";

my $media3 = 0;
$media3 = $sum2/$length3;
print "Tamanho médio das estrofes: $media3\n";

my $media4 = 0;
$media4 = $sum2/$length1;
print "Tamanho médio das poesias: $media4\n";