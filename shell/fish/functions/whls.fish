function whls --description 'Pretty much a shortcut to: ll $(which <args>)'
    # Run the which command. Save the result and exit code
    set --local result (which $argv)
    set --local exit_code $status

    if test 0 -eq $exit_code
        # The command was successful, which means it printed a path. List
        # this path.
        ls -lh $result
    else
        # Simply print the result in case of failure.
        echo $result
    end
    
    # Return the original exit code
    return $exit_code
end
