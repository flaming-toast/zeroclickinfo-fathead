#!/usr/bin/env perl
use strict;
use encoding "utf8";
use Cwd qw(chdir);
use Switch;
chdir 'download';

open RADFORD, 'VIM_Editor_Commands.htm' or die "Cannot open file 1!";
open TUX, "vimcheat.html" or die "Cannot open file 2!";
# vim {keyword} will output relevant portion of cheatsheet
# radford cheatsheet
my @entry_k = ('enter', 'insert', 'append');
my @movement_k = ('move', 'navigate');
my @exit_k = ('quit', 'exit');
my @delete_k = ('delete');
my @paste_k = ('paste');
my @copy_k = ('yank', 'copy');
my @file_k = ('open', 'save', 'read');
# tuxfile cheatsheet
my @visual_k = ('visual', 'visual mode');
my @search_k = ('find', 'search');
my @replace_k = ('regex', 'replace');
my @oopsie_k = ('undo', 'redo');

sub parse_br {
	my $str = $_[0];
	$str =~ s/<[a-zA-Z]*>//g;
	$str =~ s/<\/[a-zA-Z]*>//g;
	chomp($str);
	$str =~ s///g;
	$str =~ s/^([a-zA-Z^:])*/<b>$1<\/b>/g;
	$str = $str . "<br />";
}

while (my $line = <RADFORD>) {
	if ($line =~ m/Text Entry Commands/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Cursor/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@entry_k) {
			print "$keyword\t@blab\n";
		}	
	}
	if ($line =~ m/Cursor Movement Commands/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Exit/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@movement_k) {
			print "$keyword\t@blab\n";
		}	
	}
	if ($line =~ m/Exit Commands/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Commands/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@exit_k) {
			print "$keyword\t@blab\n";
		}	
	}
	if ($line =~ m/Text Deletion Commands/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Yank/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@delete_k) {
			print "$keyword\t@blab\n";
		}
	}	
	if ($line =~ m/Yank/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Paste/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@copy_k) {
			print "$keyword\t@blab\n";
		}	
	}
	if ($line =~ m/Paste/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Commands/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@paste_k) {
			print "$keyword\t@blab\n";
		}	
	}
	if ($line =~ m/File Manipulation Commands/) {
		my @blab = ();
		$line = <RADFORD>;
		push(@blab, &parse_br($line));
			$line = <RADFORD>;
		while (!($line =~ m/Other/)) {
			$line = <RADFORD>;
			push(@blab, &parse_br($line));
		}
		foreach my $keyword (@file_k) {
			print "$keyword\t@blab\n";
		}	
	}
	
}

