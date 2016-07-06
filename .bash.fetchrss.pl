#!/usr/bin/perl

use strict;
use warnings;

use LWP::Simple;
use Config::IniFiles;
use XML::RSS;

=pod

=head1 FUNCTIONALITY

This script fetches the newest posts from a user-defined RSS feed. 

=head1 USAGE

Add this to the top of your .bashrc to output the headlines of your RSS feed:

    perl ~/.bash.fetchrss.pl

=head1 CONFIGURATION

There should be an ini file in your home directory called "~/.bash.fetchrss.ini"
looking something like this:

    [Feed]
    RSSURL=http://path.to.your/rssfeed.xml
    WWWURL=http://link.to.your/newsprovider
    Title=Title Of Your Newsprovider

    [Output]
    Count=5

The first option is necessary and the script will die with an error if it isn't
specified in your configuration file. The second two options are optional and
the output will just look slightly differently if they are missing in the 
configuration file. The count option, which specifies the amount of headlines
that are output, defaults to 5.

=head1 AUTHOR

The author of this script is http://github.com/stewa02

=head1 COPYRIGHT AND LICENSE

Copyright 2015 by stewa02

This library is free software; you can redistribute it and/or modify it under 
the same terms as Perl itself.

=cut

sub GetConfig {
    my $ini = Config::IniFiles->new( -file => $ENV{"HOME"}."/.bash.fetchrss.ini" );

    my %conf;
    $conf{"URL"}   = $ini->val( "Feed", "RSSURL"  ) || die "No feed URL defined";
    $conf{"WWW"}   = $ini->val( "Feed", "WWWURL"  ) || "0";
    $conf{"Name"}  = $ini->val( "Feed", "Title"   ) || "0";
    $conf{"Count"} = $ini->val( "Output", "Count" ) || 5;

    return %conf;
}

sub GetFeed {
    my $url = shift;
    my $xml = get($url);
    my $rss = XML::RSS->new;
    $rss->parse($xml);
    
    my $count = shift;
    $count = $#{$rss->{'items'}} if $count > $#{$rss->{'items'}};

    my @feed;
    for (my $i = 0; $i < $count; $i++) {
       push @feed, @{$rss->{'items'}}[$i]->{'title'};
    }

    return @feed;
}

sub PrintToHandle {
    open(TEMP, ">>".$ENV{"HOME"}."/.bash.fetchrss.tmp")
        or warn "Can't open temp file!";

    foreach my $handle (*STDOUT, *TEMP) {
        print $handle join("", @_) if fileno($handle);
    }

    close(TEMP);
}

sub GenerateOutput {
    my $count = shift;
    my $name  = shift;
    my $www   = shift;
    my @headlines = @_;

    unlink($ENV{"HOME"}."/.bash.fetchrss.tmp");

    unless ($name eq "0") {
        PrintToHandle("\nNews from $name:\n\n");
    }
    else {
        PrintToHandle("\nNewsfeed:\n\n");
    }

    PrintToHandle("\t- $_\n") foreach (@headlines);
    PrintToHandle("\nLink: $www\n") unless($www eq "0");
}

sub GetTemp {
    open(READTEMP, "<".$ENV{"HOME"}."/.bash.fetchrss.tmp")
        or warn "No tempfile to read from!";
    my $file;
    READFILE: {
        local $/;
        $file = <READTEMP>;
    }
    print $file;
}

my %settings = GetConfig();
my $ping = qx/ping -c 1 8.8.8.8 2>&1/;
unless ($ping =~ m/unreachable/) {
    my @feed = GetFeed($settings{"URL"}, $settings{"Count"});
    GenerateOutput($settings{"Count"}, $settings{"Name"}, $settings{"WWW"}, @feed);
}
else {
    GetTemp();
}

