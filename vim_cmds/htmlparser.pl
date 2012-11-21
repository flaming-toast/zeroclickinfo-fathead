#!/usr/bin/perl -w 
package Example;
use strict;
use encoding "utf8";
require HTML::Parser;
@Example::ISA = qw(HTML::Parser);

my $parser = Example->new;

$parser->parse_file('download/vimcheat.html');

print $parser->{TEXT};

sub text 
{
	my ($self,$text) = @_;
	$self->{TEXT} .= $text;
}
