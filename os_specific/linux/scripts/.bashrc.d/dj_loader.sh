GITHUB_ACCOUNT="malagacj"
GITHUB_FOLDER="$HOME/$GITHUB_ACCOUNT/github"
PYTHON_VERSION="python3.9"


_github_projects () {
  local opts cur
	cur="${COMP_WORDS[COMP_CWORD]}"
  opts=`ls ~/$GITHUB_ACCOUNT/github`
  COMPREPLY=( $(compgen -W "$opts" ${cur}) )
  return 0
}

restart_project () {
	PROJECT_FOLDER=$GITHUB_FOLDER/$1

	# Remove project folder if it already exists
	if [ -d $PROJECT_FOLDER ]; then
	  rm -rf $PROJECT_FOLDER
	fi

	mkdir $PROJECT_FOLDER
	cd $PROJECT_FOLDER

	git clone git@github.com:$GITHUB_ACCOUNT/$1.git

	bash -c "$PYTHON_VERSION -m venv env"
	./env/bin/pip install -U pip setuptools

	for file in `find . -name requirements*.txt`
	do
		./env/bin/pip install -r $file
	done

	cd -
}

load_project () {
	cd $GITHUB_FOLDER/$1/$1
	. ../env/bin/activate
}

complete -F _github_projects restart_project
complete -F _github_projects load_project
