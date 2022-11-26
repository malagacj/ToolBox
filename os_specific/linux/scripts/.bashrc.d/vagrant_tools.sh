VAGRANT_FOLDER="$HOME/vagrant"
MACHINES_FOLDER="$VAGRANT_FOLDER/machines"
TEMPLATES_FOLDER="$VAGRANT_FOLDER/templates"
VAGRANTFILE_DEFAULT="debian_bullseye_public_dwm.erb"
VAGRANTFILE_DEFAULT="debian_bullseye_public_prometheus.erb"
VAGRANTFILE_DEFAULT="debian_bullseye_public_prometheus_exporter.erb"

mkdir_plus () {
	if [ ! -d $1 ]; then
		mkdir -p $1
	fi
}

vagrant_folder_setup () {
	# Cannot perform expansion here...
	# mkdir_plus $VAGRANT_FOLDER/{machines,templates}
	# test in mkdir_plus is done on single paths :(
	mkdir_plus $MACHINES_FOLDER
	mkdir_plus $TEMPLATES_FOLDER
}

vagrant_project_environment () {
	project_folder=$MACHINES_FOLDER/$1
}

vagrant_plus () {
	vagrant_project_environment $1

	mkdir_plus $project_folder
	cd $project_folder

	if [ ! -e Vagrantfile ]; then
		vagrant init --template $TEMPLATES_FOLDER/$VAGRANTFILE_DEFAULT
	fi

	vagrant up
	vagrant ssh
}


vagrant_plus_destroy () {
	vagrant_project_environment $1

	cd $project_folder
	vagrant destroy

	cd -
	rm -rf $project_folder
}


# Setting up folder directories for vagrant_plus to work
vagrant_folder_setup


_vagrant_plus() {
	local cur prev opts
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ $prev = "vagrant_plus" ]; then
		opts=`ls $MACHINES_FOLDER`
		COMPREPLY=( $(compgen -W "$opts" ${cur}) )
		return 0

	elif [ $prev = "-t" ]; then
		opts=`ls $TEMPLATES_FOLDER`
		COMPREPLY=( $(compgen -W "$opts" ${cur}) )
		return 0

	else
		opts=`ls`
		COMPREPLY=( $(compgen -W "$opts" ${cur}) )
		return 0
	fi
}

_vagrant_plus_destroy() {
	local cur opts prev
	COMPREPLY=()
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"

	if [ $prev = "vagrant_plus_destroy" ]; then
		opts=`ls $MACHINES_FOLDER`
		COMPREPLY=( $(compgen -W "$opts" ${cur}) )
		return 0
	fi
}

complete -F _vagrant_plus vagrant_plus
complete -F _vagrant_plus_destroy vagrant_plus_destroy
