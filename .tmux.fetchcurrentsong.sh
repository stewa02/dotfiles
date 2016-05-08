#!/bin/bash

<<DOC

FUNCTIONALITY: Output current song and artist from Banshee to the terminal. Can
be used to include this information into statuslines and terminal welcome 
messages.

USAGE: The formatted output can be included wherever you want. The simplest
example would be to add it to your bash welcome message by adding:

    ~/.tmux.fetchcurrentsong.sh

to your .bashrc. However you can add the information to statuslines like the one
of tmux, to be fully informed about the track you're currently listening to.

CONFIGURATION: You don't need to configure anything! But be aware of the fact,
that this little script only works for the music player "Banshee".

AUTHOR: The author of this script is http://github.com/stewa02

COPYRIGHT AND LICENSE: Copyright 2015 by stewa02. 

DOC

is_player_running=`ps aux | grep banshee | grep -v grep`

printf \\u266A

if [ -e "/usr/bin/banshee" ]; then

    if [ -n "$is_player_running" ]; then
        artist=`banshee --query-artist | sed s/artist:\ //`
        title=`banshee --query-title | sed s/title:\ //`
        
        if [ -n "$artist" ] && [ -n "$title" ]; then
            echo " $artist - $title"
        else
            echo " No Title"
        fi
    else
        echo " Banshee not running!"
    fi

else
    echo " Banshee not installed!"
fi
