#! /bin/bash

#sudo apt-get install texlive-full


mkdir temp; cd temp
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -xf install-tl-unx.tar.gz
cd install-tl-20200606/
#sudo perl install-tl
cd ../..; rm -rf temp

#Welcome to TeX Live!


#See /usr/local/texlive/2020/index.html for links to documentation.
#The TeX Live web site (https://tug.org/texlive/) contains any updates and
#corrections. TeX Live is a joint project of the TeX user groups around the
#world; please consider supporting it by joining the group best for you. The
#list of groups is available on the web at https://tug.org/usergroups.html.
#
#
#Add /usr/local/texlive/2020/texmf-dist/doc/man to MANPATH.
#Add /usr/local/texlive/2020/texmf-dist/doc/info to INFOPATH.
#Most importantly, add /usr/local/texlive/2020/bin/i386-linux
#to your PATH for current and future sessions.
#Logfile: /usr/local/texlive/2020/install-tl.log


# Reference:
# https://www.tug.org/texlive/quickinstall.html
# https://tug.org/texlive/acquire-netinstall.html
