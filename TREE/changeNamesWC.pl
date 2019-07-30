    use strict;
    use warnings;

my $file=$ARGV[0]; ##File to change
my $fileNames=$ARGV[1]; ##Informatio for the change
my %NAMES=read_names($fileNames);
changenames($file);

###### OrgS Hash de arrays
sub read_names{
	my $file=shift;
	my %ORGS;

	open (FILE,$file) or die "Could not open file";

	foreach my $line (<FILE>){
		chomp $line;
#		print "$line \n";
		my @sp=split("\t",$line);
#		print"$sp[0] $sp[1]\n";

		$ORGS{$sp[0]}=$sp[1];	
		print"$sp[0]-> $ORGS{$sp[0]}\n"	
		}

	close FILE;
	return %ORGS;
	
	}
###### OrgS Hash de arrays
sub changenames{
	my $file=shift;

	open (FILE,$file) or die "Could not open file $!";
	open (SALIDA, ">$file.changed") or die "Could not open file $!";
	foreach my $line (<FILE>){
		foreach my $id(keys %NAMES){
			chomp $line;
			if($line=~m/$id/g){
				#print "$id\n";
				#my $NAMES{$id};
				my $new_name=$NAMES{$id};
				$line=~s/$id/$new_name/g;
				}	
			}
		print SALIDA "$line\n";
		}
	close FILE; close SALIDA;
	}
