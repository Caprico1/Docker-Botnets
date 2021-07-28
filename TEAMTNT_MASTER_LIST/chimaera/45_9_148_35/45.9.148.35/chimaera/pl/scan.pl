#!/usr/bin/perl -w
use Net::Ping;
use Time::HiRes qw(gettimeofday);
use Term::ANSIColor;
use 5.010;
 
print "ping tester\n--------------------------\n";
#print "enter ip: ";

#get address
#chomp(my $host = );
#print "host: $host\n";

#create ping object
my $p = Net::Ping->new('icmp');
#hi res time
$p->hires();

#a single ip address
my $host;

#up / down devices
my @online_devices; 
my @offline_devices; 

#get address range from user
print "Enter IP address range: ";
chomp(my $ip_range = );
#print "range: $ip_range\n";
$ip_range =~ /(\d+\.\d+\.\d+)\.(\d+)-(\d+)/;
my $network = $1;
my $start_ip = $2;
my $end_ip = $3;
#print "start IP: $start_ip\nend IP: $end_ip\n";

#get t0 for benchmark
my $t0 = gettimeofday();

for(my $i=$start_ip;$i<=$end_ip;$i++)	{
	$host = "$network.$i";
	print "checking $host....\n";
	
	#list context, returns duration
	my ($ret, $dur, $ip) = $p->ping($host, 0.25);
	
	#format time
	$dur = sprintf("%.6f", $dur); 	
	
	#results
	if($ret){
		print colored  ("$host is up  latency: $dur seconds", 'white on_green');
		print "\n";
		push @online_devices, $host;
	}#end if
	else{
		print colored ("$host down", 'white on_red');
		print "\n";
		push @offline_devices, $host;
	}#end else		
	print "-----------------------------\n";
}#end for

#kill ping object
$p->close();

#benchmarking results
my $t1 = gettimeofday();
my $elapsed = $t1 - $t0; 
$elapsed = sprintf("%6f", $elapsed);
print "\ntime elapsed: $elapsed....\n";

#report file
open RP, ">", "report.txt" or die $!;

#results
my $up_sz = @online_devices;
my $down_sz = @offline_devices;
print "$up_sz devices online\n$down_sz devices offline\n";

print "\nOnline devices....\n------------------------------------------------------\n";
print RP "Online devices....\n------------------------------------------------------\n";
foreach $a (@online_devices){
	say $a;
	print RP $a."\n"; 
}#end foreach

print "\n\nOffnline devices....\n------------------------------------------------------\n";
print RP "Offline devices....\n------------------------------------------------------\n";
foreach $a (@offline_devices){
	say $a;
	print RP $a."\n"; 
}#end foreach

close RP;
