#!/usr/bin/perl -I../lib

# Usage: uniq_oo.pl < file

use IO::Handle::Moose;

$IO::Handle::Moose::Debug = $ENV{DEBUG};

my $stdin  = IO::Handle::Moose->new(fd=>\*STDIN,  mode=>'r');
my $stdout = IO::Handle::Moose->new(fd=>\*STDOUT, mode=>'w');

my $prev = '';
while (not $stdin->eof) {
    my $line = $stdin->getline;
    $stdout->print($line) if $line ne $prev;
    $prev = $line;
}

$stdin->close;
$stdout->close;
