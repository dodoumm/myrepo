#!/usr/bin/perl

use strict;
use warnings;

my @subject;
my @sum;
my $student_count = 0;

while (<>) {
    chomp;
    my @field = split(/\s+/);

    # 첫 줄(헤더)
    if ($. == 1) {
        @subject = @field[2 .. $#field];

        print join("\t", @field), "\t총점\t평균\n";
        next;
    }

    my $total = 0;
    my $subject_count = $#field - 1;

    for (my $i = 2; $i <= $#field; $i++) {
        $total += $field[$i];
        $sum[$i] += $field[$i];
    }

    my $avg = $total / $subject_count;

    print join("\t", @field);
    printf "\t%d\t%.1f\n", $total, $avg;

    $student_count++;
}

print "\n과목평균";

for (my $i = 2; $i < @sum; $i++) {
    printf "\t%.1f", $sum[$i] / $student_count;
}

print "\n";
