# Alpine (Docker)


## Python3.10 - Alpine 3.15

These are the more generic packages to be installed
```bash
sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install python3-venv
sudo apt install python3-dev
```

Additionally, compilation will require some "Header" files. Information about those two packages can be found in [libldap2-dev] and [libsasl2-dev]
```bash
sudo apt install libldap2-dev
sudo apt install libsasl2-dev
```

[libldap2-dev]: https://packages.debian.org/cgi-bin/search_contents.pl?word=lber.h&searchmode=searchfiles&case=insensitive&version=stable&arch=i386
[libsasl2-dev]: https://manpages.debian.org/buster/libsasl2-dev/sasl_server_new.3.en.html

