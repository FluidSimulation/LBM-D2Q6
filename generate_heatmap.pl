#! /usr/bin/env perl
defined $ARGV[0] or die "No input file";
$in_file = $ARGV[0];
open ( PLOT, "|gnuplot" );
    chomp $in_file;
    $out_file = $in_file;
    $out_file =~ s/mat/png/;
    print "$in_file $out_file\n";
    print PLOT <<EOSCRIPT;
set size 1.0,1.0
set term png size 1536,1024
set output "$out_file"
set style data pm3d
unset colorbox
unset xtic
unset ytic
unset ztic
set view 0,0,1.5
splot "$in_file" binary
EOSCRIPT

