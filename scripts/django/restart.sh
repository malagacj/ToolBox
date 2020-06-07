#! /bin/bash

# Variables definition
env="env"

removing_old () {
	rm -rf $env
}

usable_virtualenv_creation () {
	python3 -m venv $env
	. ${env}/bin/activate
	pip install --upgrade pip setuptools pkg-resources
}

dependencies_installation () {
	local dir
	dir="`basename $(pwd)`"
	pip install -r $dir/requirements.txt
}

summary () {
	cat <<- _EOF_
	The virtual Environment has been created in .$env
	Timestamp: $(date)
	_EOF_
}


removing_old
usable_virtualenv_creation
dependencies_installation
summary
