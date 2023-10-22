# Maven Setup

## Download Maven binary
Download the Maven binary from [https://maven.apache.org/download.cgi](https://maven.apache.org/download.cgi)

## Create folder to keep binary programs
```bash
mkdir ~/programs
```

## Untar Maven binary file
```bash
mv <path_to_maven_binary> ~/programs
cd ~/programs
tar -xvzf ./apache-maven-3.9.5-bin.tar.gz
```

## Add binary folder to PATH
Edit your ~.bashrc file
Go to the bottom of the file and add the following

```
PATH=$PATH:/home/<user>/programs/apache-maven-3.9.5/bin
```

Load ~/.bashrc file for changes to take effect
```bash
. ~/.bashrc
```

## Check tha Maven is installed correctly
```bash
mvn -v
```
