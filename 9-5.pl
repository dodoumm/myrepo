#!/usr/bin/perl

use strict;
use warnings;

my %count;

while (<>) {
    chomp;
    $count{$_}++;
}

foreach my $word (sort keys %count) {
    print "$word : $count{$word}\n";
}
