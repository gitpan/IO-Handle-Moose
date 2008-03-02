#!/usr/bin/perl -I../lib

# Usage: uniq_func.pl < file

use IO::Handle::Moose;

$IO::Handle::Moose::Debug = $ENV{DEBUG};

my $stdin  = new_from_fd IO::Handle::Moose \*STDIN,  '<';
my $stdout = new_from_fd IO::Handle::Moose \*STDOUT, '>';

my $prev = '';
while (not eof $stdin) {
    my $line = <$stdin>;
    print $stdout $line if $line ne $prev;
    $prev = $line;
}

close $stdin;
close $stdout;
