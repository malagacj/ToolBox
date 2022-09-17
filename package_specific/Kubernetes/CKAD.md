## Commandas and Arguments
To indicate the commands that must be run for containers that don't have a running procces defined for it
* command: This is equivalente to the ENTRYPOINT in Dockerfiles
* args: This is equivalent to CMD in Dockerfiles

A CMD after an ENTRYPOINT defines the default argument for a container

```bash
containers
  - image: ubuntu
    name: ubuntu
    command: ["sleep"]
    args: ["5000"]
```

This is apply changes that cannot be edited directly in a POD
```bash
kubectl replace --force -f <file_name>.yaml
```
