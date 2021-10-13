# Cheatsheet for Kubernetes

## Pods

### Creating pods
#### CLI
```
kubectl run <podname> --image=<imagename>
```

#### file.yaml
```
kubectl apply -f <file.yaml>

or

kubectl create -f file.yaml
```

### Deleting pods
```
kubectl delete pod <podname>
```

### Pods Description
```
kubectl get pods
kubectl describe pod <podname>
kubectl get pods -o wide
```


## ReplicaSets

### Creating Replicasets
```
kubectl create -f <replicaset-definition.yaml>
```

### Deleting ReplicaSets
```
kubectl delete replicaset <replicaset_name>
```

### ReplicaSets Description
```
kubectl get replicaset
```

### Updating ReplicaSets
```
kubectl replace -f <replicaset-definition.yaml>
kubectl scale -replicas=6 -f <replicaset-definition.yaml>
kubectl edit replicaset <replicaset_name> # To edit replicaset Live
kubectl scale replicaset myapp-rs --replicas=2 # Another way to scale a ReplicaSet
```


## Replication Controller (old)

### Creating Replication Controller
```
kubectl create -f <replication-controller.yaml>
```

### Deleting Replication Controllers
```
kubectl delete replicationcontroller <replication_controller_name>
```

### Replication Controllers Description
```
kubectl get replicationcontroller
```

### Updating Replication Controllers
```
kubectl replace -f <replication-controller.yaml>
kubectl scale -replicas=6 -f <<replication-controller.yaml>
```
```


## Deployment

### Creating Deployment
```
kubectl create -f <deployment.yaml> --record
```

### Deleting Deployment
```
kubectl delete deployment <deployment_name>
```

### Deployment rollout
```
kubectl rollout status deployment/<deployment_name>
kubectl rollout history deployment/<deployment_name>
kubectl rollout undo deployment/<deployment_name>
```

### Updating Deployment
```
kubectl apply -f <deployment.yaml> --record
kubectl edit deployment <deployment_name> --record
kubectl set image deployment/<deployment_name> image-name=image-name:1.9.1 --record
```

## Notes
--record is not mandatory, but it records "CHANGE/CAUSE". Flag will be deprecated
