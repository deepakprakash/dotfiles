# Function that can be used as a replacement for `which`
# In addition to the usual `which`, it does a full ls if the which returns a path
# Useful when you want to really want to know the full path of the command.
# Pretty much a shortcut to: ll $(which <args>)

whls() {
	if output=$(which "$@") && [[ -e "$output" ]]; then
		# The argument was found and it is pointing to a file. So do an ls on it.
		ll "$output"
	else
		# The argument was either not found or it wan an alias, function, built-in command, etc
		# So we simply call which again (yes, it maybe more efficient to echo the output, but this seems cleaner
		# since any formatting that the which command may output, stderr output, etc can be preserved)
		which "$@"
	fi
}
