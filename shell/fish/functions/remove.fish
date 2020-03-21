
function remove --argument-names variable value --description "Remove all occurences of the second argument from variable corresponding to first argument."
    while set index (contains --index $value $$variable)
        set --erase $variable\[$index\]
    end
end
