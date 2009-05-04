#!/usr/bin/perl

sub checkForRoot{
	$appName = shift;
	if ( $< != 0 ) {
	    displayError("$appName must be run as root (or use sudo).");
	}
}

sub printTitle {
	print "\n";
}

sub checkPathExists {
	$path = shift;
	if ( -d "$path" ) {
	}
	else {
	    displayError("The path $path does not exist!");
	}

}

sub massagePath {
	$path = shift;
	# Remove carrage return
	chomp($path);    
	$lastCharacterOfPath = substr $path, -1, 1;

	# Add a forwardslash to the end if missing
	if ( $lastCharacterOfPath ne '/' ) {
	    $path = $path . '/';
	}
}

sub displayError {
    $errorText = shift;
    print color 'bold red';
    print "ERROR: ";
    print color 'reset';
    print "$errorText\n\n";
    exit 1;

}

1;
