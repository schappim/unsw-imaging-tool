#!/usr/bin/perl
use File::Path;
use File::Copy;


sub convertPathToHD($){
	my $string = shift;
	my $offset = index($string, '/home/');
	
	if($offset == -1){
	}
	else{
		$offset = $offset + 5;
		my $fragment =  substr $string, $offset;
		my $userString = $ENV{HOME} . "$fragment"; 
		return $userString;
	}
}

sub recurse($) {
  my($path) = @_;

  ## append a trailing / if it's not there
  $path .= '/' if($path !~ /\/$/);

  ## print the directory being searched
	$homechecker = index($path, '/home/');
	
	if($homechecker == -1){
	}
	else{

	$userPath = convertPathToHD($path);
  
	
	chomp($userPath);
	
  print "old path - ", $path,"\n";
  print "new path - ", $userPath,"\n";

	if (! -d $userPath)
	{
		if ($userPath ne ''){
	 print "userPath: $userPath does not exist\n";
   mkpath "$userPath" or die "Failed to create $userPath: $!\n";
	 }
	}
  }
	
	
  ## loop through the files contained in the directory
  for my $eachFile (glob($path.'*')) {

    ## if the file is a directory
    if( -d $eachFile) {
      ## pass the directory to the routine ( recursion )
      recurse($eachFile);
    } else {

      ## print the file ... tabbed for readability
      print "\t",$eachFile,"\n";

			$homechecker = index($eachFile, '/home/');

			if($homechecker == -1){
			}
			else{

			$userFilePath = convertPathToHD($eachFile);
			
			if (-e "$userFilePath") {
			print "File exists!";
			copy($eachFile,$userFilePath) or die "Failed to copy $file: $!\n";
			}
			else {
			print "File does not exist.";
			copy($eachFile,$userFilePath) or die "Failed to copy $file: $!\n";
			
			}
			
		   }

    }
  }
}

## initial call ... $ARGV[0] is the first command line argument
recurse($ARGV[0]);