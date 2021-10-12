# Cheatsheet for Kubernetes

## Creating pods
### CLI
```
kubectl run <podname> --image=<imagename>
```

### file.yaml
```
kubectl apply -f <file.yaml>

or

kubectl create -f pod.yaml
```

## Deleting pods
```
kubectl delete pod <podname>
```

## Pods Description
```
kubectl get pods
kubectl describe pod <podname>
kubectl get pods -o wide
```
