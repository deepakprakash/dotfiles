
function remove --argument-names variable value --description "Remove all occurences of the second argument from variable corresponding to first argument."
    # echo (contains --index $value $$variable)
    while set index (contains --index $value $$variable)
        echo '$index: ' $index
        set --erase $variable\[$index\]
    end
end
