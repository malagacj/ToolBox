#! /bin/bash

pylint_check () {
	local filename
	filename=funny_names
	test -e $filename || pylint -rn --max-line-length=79 --generate-rcfile > ${filename}.pylintrc

	pylint --rcfile ${filename}.pylintrc "$1"
}

pydocstyle_check() {
	pydocstyle "$1"
}

summary () {
	cat <<- _EOF_
	$1
	##########

	Pylint check:
	$(pylint_check $1)


	Pydocstyle check:
	$(pydocstyle_check $1)

	END
	##########


	_EOF_
}

if [ $# -gt 0 ]; then
	while [ $# -gt 0 ]; do
		summary $1
		shift
	done
else
	for pythonfile in *.py; do
		summary $pythonfile
	done
fi
