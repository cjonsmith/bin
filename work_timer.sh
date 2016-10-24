if [ ! -f $HOME/.ista_timehelper.txt  ]; then
    echo "Hidden file ista_timehelper.txt was not found!"
    echo "Making file now..."
    echo $PS1 > $HOME/.ista_timehelper.txt # Old PS1 value
    echo "$(date +%s)" >> $HOME/.ista_timehelper.txt # Starting time
    PS1="[ON THE CLOCK]$ "
else
    echo "Hidden file ista_timehelper.txt found!"
    echo "Deleting file, reseting PS1 shell variable, and calculating time now..."
    oldPS1="$(head -1 $HOME/.ista_timehelper.txt)"
    startTime="$(tail -1 $HOME/.ista_timehelper.txt)"
    endTime="$(date +%s)"
    echo "oldPS1: $oldPS1"
    echo "startTime: $startTime"
    echo "endTime: $endTime"
    echo "total time: $(( (endTime - startTime) / 60)) minutes."
    PS1=$oldPS1" "
    rm $HOME/.ista_timehelper.txt
fi

