#!/usr/bin/perl -w
#Protein amino acid composition interms of percentages

use strict;
use warnings;
unless($#ARGV==0){
	print "USAGE: perl protein_stats.pl file\n";
	exit;
}

my $id = $ARGV[0];
open(IN, $id);
$/ = "\n>";
while(<IN>){
	s/>//g;
	my($header, @seq) = split(/\n/,$_);
	my $string_seq = join "",@seq;
	my $length = length($string_seq);
	my $A = () = $string_seq =~ /A/gi;
	my $B = () = $string_seq =~ /B/gi;
	my $R = () = $string_seq =~ /R/gi;
	my $N = () = $string_seq =~ /N/gi;
	my $D = () = $string_seq =~ /D/gi;
	my $C = () = $string_seq =~ /C/gi;
	my $Q = () = $string_seq =~ /Q/gi;
	my $E = () = $string_seq =~ /E/gi;
	my $G = () = $string_seq =~ /G/gi;
	my $H = () = $string_seq =~ /H/gi;
	my $I = () = $string_seq =~ /I/gi;
	my $L = () = $string_seq =~ /L/gi;
	my $K = () = $string_seq =~ /K/gi;
	my $M = () = $string_seq =~ /M/gi;
	my $F = () = $string_seq =~ /F/gi;
	my $P = () = $string_seq =~ /P/gi;
	my $S = () = $string_seq =~ /S/gi;
	my $T = () = $string_seq =~ /T/gi;
	my $W = () = $string_seq =~ /W/gi;
	my $Y = () = $string_seq =~ /Y/gi;
	my $V = () = $string_seq =~ /V/gi;
	my $X = () = $string_seq =~ /X/gi;
	my $Z = () = $string_seq =~ /Z/gi;

	# Percentage of each Amino acid

	my $ap = sprintf "%0.2f", ($A/$length)*100;
	my $bp = sprintf "%0.2f", ($B/$length)*100;
	my $cp = sprintf "%0.2f", ($C/$length)*100;
	my $dp = sprintf "%0.2f", ($D/$length)*100;
	my $ep = sprintf "%0.2f", ($E/$length)*100;
	my $fp = sprintf "%0.2f", ($F/$length)*100;
	my $gp = sprintf "%0.2f", ($G/$length)*100;
	my $hp = sprintf "%0.2f", ($H/$length)*100;
	my $ip = sprintf "%0.2f", ($I/$length)*100;
	my $kp = sprintf "%0.2f", ($K/$length)*100;
	my $lp = sprintf "%0.2f", ($L/$length)*100;
	my $mp = sprintf "%0.2f", ($M/$length)*100;
	my $np = sprintf "%0.2f", ($N/$length)*100;
	my $pp = sprintf "%0.2f", ($P/$length)*100;
	my $qp = sprintf "%0.2f", ($Q/$length)*100;
	my $rp = sprintf "%0.2f", ($R/$length)*100;
	my $sp = sprintf "%0.2f", ($S/$length)*100;
	my $tp = sprintf "%0.2f", ($T/$length)*100;
	my $vp = sprintf "%0.2f", ($V/$length)*100;
	my $wp = sprintf "%0.2f", ($W/$length)*100;
	my $xp = sprintf "%0.2f", ($X/$length)*100;
	my $yp = sprintf "%0.2f", ($Y/$length)*100;
	my $zp = sprintf "%0.2f", ($Z/$length)*100;

	# Percentage of AA with Aliphatic side chain
	my $aliphatic = sprintf "%0.2f", (($G+$A+$V+$L+$I)/$length)*100;

	# Percentage of AA with Aromatic side chain
	my $aromatic = sprintf "%0.2f", (($F+$W+$Y)/$length)*100;

	# Percentage of Sulphur containing AA.
	my $sulphur = sprintf "%0.2f", (($C+$M)/$length)*100;

	# Percentage of Basic AA
	my $basic = sprintf "%0.2f", (($B+$D+$E+$N+$Q+$Z)/$length)*100;

	# Percentage of AA containing aliphatic hydroxyl group
	my $hydroxyl = sprintf "%0.2f", (($S+$T)/$length)*100;

	# Percentage of AA belong to t-rna synthase class-I
	my $trna1 = sprintf "%0.2f", (($Z+$E+$Q+$R+$C+$M+$V+$I+$L+$Y+$W)/$length)*100;

	# Percentage of AA belong to t-rna synthase class-II
	my $trna2 = sprintf "%0.2f", (($B+$G+$A+$P+$S+$T+$H+$D+$N+$K+$F)/$length)*100;

	# Print all results

	print "A : $ap\nB : $bp\nC : $cp\nD : $dp\nE : $ep\nF : $fp\nG : $gp\nH : $hp\nI : $ip\nK : $kp\nL : $lp\nM : $mp\nN : $np\nP : $pp\nQ : $qp\nR : $rp\nS : $sp\nT : $tp\nV : $vp\nW : $wp\nX : $xp\nY : $yp\nZ : $zp\n\n";
	
	print "Aliphatic AA % : $aliphatic\nAromatic AA % : $aromatic\nSulphur containing AA % : $sulphur\nAliphatic OH containing AA % : $hydroxyl\nt-RNA synthase class-I : $trna1\nt-RNA synthase class-II : $trna2\n\n";
}

