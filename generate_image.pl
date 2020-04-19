#! /usr/bin/env perl
#@files = split ( /[\s]+/, `ls data/*.txt` );
defined $ARGV[0] or die "No input file";
$in_file = $ARGV[0];
open ( PLOT, "|gnuplot" );
    chomp $in_file;
    $out_file = $in_file;
    $out_file =~ s/txt/png/;
    print "$in_file $out_file\n";
    print PLOT <<EOSCRIPT;
set key above
set term png size 1024,1024
set output "$out_file"
plot [0:152] [0:152] "$in_file" w vectors
EOSCRIPT

