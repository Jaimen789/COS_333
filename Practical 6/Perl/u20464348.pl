#!/usr/bin/perl

use strict;
use warnings;

# Check if the input file is provided as a command-line argument
if (@ARGV < 1) {
    die("Usage: find_longest_lastname.pl inputfile.txt\n");
}

my $inputFile = $ARGV[0];  # Get the input file name from the command line

# Check if the input file exists
if (!-e $inputFile) {
    die("Input file not found.\n");
}

# Initialize variables to track the longest last name and the associated student number
my $longestLastName = "";
my $earliestAlphabeticalLastName = "zzzzzzzzzzzzzz";  # Set to a high value initially
my $studentNumber = "Nonefound";

# Read and process the input file
open(my $fh, '<', $inputFile) or die("Cannot open $inputFile: $!\n");
while (my $line = <$fh>) {
    my ($studentNum, $name) = split(/,/, $line);
    my @nameParts = split(' ', $name);
    my $lastName = $nameParts[-1];

    if (length($lastName) > length($longestLastName) ||
        (length($lastName) == length($longestLastName) && $lastName lt $earliestAlphabeticalLastName)) {
        $longestLastName = $lastName;
        $earliestAlphabeticalLastName = $lastName;
        $studentNumber = $studentNum;
    }
}

close($fh);

# Output HTML result
print "<html><body>\n";
print "Student with the longest last name: $studentNumber\n";
print "</body></html>\n";
