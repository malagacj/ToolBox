# Cheatsheet for Kubernetes

## Pods

### Creating pods
#### CLI
```bash
kubectl run <podname> --image=<imagename>
```

#### file.yaml
##### Creating sample yaml file
```bash
kubectl run <pod_name> --image=<container_image> --dry-run=client -o yaml > file.yaml
```
##### Creating POD
```bash
kubectl apply -f <file.yaml>

or

kubectl create -f file.yaml
```

### Deleting pods
```bash
kubectl delete pod <podname>
```

### Pods Description
```bash
kubectl get pods
kubectl describe pod <podname>
kubectl get pods -o wide
```


## ReplicaSets

### Creating Replicasets
```bash
kubectl create -f <replicaset-definition.yaml>
```

### Deleting ReplicaSets
```bash
kubectl delete replicaset <replicaset_name>
```

### ReplicaSets Description
```bash
kubectl get replicaset
```

### Updating ReplicaSets
```bash
kubectl replace -f <replicaset-definition.yaml>
kubectl scale -replicas=6 -f <replicaset-definition.yaml>
kubectl edit replicaset <replicaset_name> # To edit replicaset Live
kubectl scale replicaset myapp-rs --replicas=2 # Another way to scale a ReplicaSet
```


## Replication Controller (old)

### Creating Replication Controller
```bash
kubectl create -f <replication-controller.yaml>
```

### Deleting Replication Controllers
```bash
kubectl delete replicationcontroller <replication_controller_name>
```

### Replication Controllers Description
```bash
kubectl get replicationcontroller
```

### Updating Replication Controllers
```bash
kubectl replace -f <replication-controller.yaml>
kubectl scale -replicas=6 -f <<replication-controller.yaml>
```


## Deployment

### Creating Deployment
```bash
kubectl create -f <deployment.yaml> --record
```

### Deleting Deployment
```bash
kubectl delete deployment <deployment_name>
```

### Deployment rollout
```bash
kubectl rollout status deployment/<deployment_name>
kubectl rollout history deployment/<deployment_name>
kubectl rollout undo deployment/<deployment_name>
```

### Updating Deployment
```bash
kubectl apply -f <deployment.yaml> --record
kubectl edit deployment <deployment_name> --record
kubectl set image deployment/<deployment_name> image-name=image-name:1.9.1 --record
```

### Notes
--record is not mandatory, but it records "CHANGE/CAUSE". Flag will be deprecated


## Service
### Background
- NodePort: Used for external access to the Pods
- ClusterIP: Used for internal communication between Pods
- LoadBalancer: Balances load to each Node in the Cluster

#### NodePort
Rules in spec:
- port: only this is required
- targetPort : If not given, its value is asumed to be the same as port
- nodePort: The valid range is 30000 - 32767. If not given, a value within the valid range is allocated.

NodePort acts as a Load Balancer between the Pods using a random algorithm. A different Pod will usually the request

If Pods are distributed accross several nodes, the service also expands accross all nodes. No additional configuration is required.

#### ClusterIP
It is the default type of Service. So if nothing is specified, ClusterIP will be the type of Service
One use is for Microservices within the cluster

#### LoadBalancer
Only works on supported Cloud. It enables the native Load Balancer of that platform

It replaces NodePort, as NodePort will use any of the IPs of its worker Nodes to grant services to the end user. NodePort will be applied if LoadBalancer is selected on an unsupported cluster

Note:
A VM could be created for Load Balancing purposes installing a suitable Load Balancer like Nginx or hrpoxy.



### Creating Service
```bash
kubectl create -f <service.yaml>
```

### Getting Service and Service Url
```bash
kubectl get service # also services and svc work
```

Urls:
If using minikube:
```bash
minikube service <service_name> --url
```

### Deleting Deployment
```bash
kubectl delete service <service_name>
```

### Updating Deployment
```bash
kubectl apply -f <service.yaml>
kubectl edit service <service_name>
```


## Notes
Use "." to create all files:

```bash
kubectl create -f .
```
Use [kubeadm](https://kubernetes.io/docs/reference/setup-tools/kubeadm/) to setup a Kubernetes cluster.
