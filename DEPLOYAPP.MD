### Setting things up in Kubernetes

We will need to create some namespaces, and while we are at it we can create the services the petclinc app uses. For convienence we have put them all in one folder call init-app

Remember to modify 02-config-map.yaml as described in [CHANGES.MD](./CHANGES.MD)

1. #### Init the cluster ###

```
kubectl apply -f k8s/init-app/ 
```

#### Verify the namespace creation ####

```
✗  kubectl get ns
NAME                           STATUS   AGE
default                        Active   4d22h
kube-node-lease                Active   4d22h
kube-public                    Active   4d22h
kube-system                    Active   4d22h
spring-petclinic               Active   42h
vmware-system-auth             Active   4d22h
vmware-system-cloud-provider   Active   4d22h
vmware-system-csi              Active   4d22h
vmware-system-tmc              Active   4d22h
wavefront                      Active   42h
```

#### Verify that the services are available:

```
✗ kubectl get svc -n spring-petclinic
NAME                TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)             AGE
api-gateway         LoadBalancer   10.7.250.24    <pending>     80:32675/TCP        36s
customers-service   ClusterIP      10.7.245.64    <none>        8080/TCP            36s
vets-service        ClusterIP      10.7.245.150   <none>        8080/TCP            36s
visits-service      ClusterIP      10.7.251.227   <none>        8080/TCP            35s
wavefront-proxy     ClusterIP      10.7.253.85    <none>        2878/TCP,9411/TCP   37s
```

2. #### Deploy Wavefront Proxy to Cluster in wavefront namespace ####

We are going to use Helm to install the wavefront proxy.

We have already created the wavefront namespace so now we need to add the wavefront repository and update helm on your machine

```
helm repo add wavefront https://wavefronthq.github.io/helm/ && helm repo update
```

Now we can run the helm chart to deploy the wwavefront-proxy

```
helm install wavefront wavefront/wavefront --namespace wavefront \
    --set clusterName=<cluster name> \
    --set wavefront.url=https://<wavefront url>.wavefront.com \
    --set wavefront.token=<wavefront token> \
    --set proxy.traceZipkinApplicationName=spring-petclinic \
    --set proxy.zipkinPort=9411 \
    --set collector.logLevel=info
```

If this is being deployed to TKGs add to the above command before runing it

```
    --set projectPacific.enabled=true \
```

If you need to unistall the wavefront proxy for some reason just run

```
helm uninstall wavferont
```

3. #### Settings up databases with helm ####

Use helm to deploy the three databases used by the app

Make sure you have a single `default` StorageClass in your Kubernetes cluster, as these Helm Charts use dynamic persistant volumes.

```bash
✗ kubectl get sc
NAME                                PROVISIONER              RECLAIMPOLICY   VOLUMEBINDINGMODE   ALLOWVOLUMEEXPANSION   AGE
vsphere-with-kubernetes (default)   csi.vsphere.vmware.com   Delete          Immediate           true                   4d23h
```

Deploy the databases:

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install vets-db-mysql bitnami/mysql --namespace spring-petclinic --version 6.14.3 --set db.name=service_instance_db
helm install visits-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db
helm install customers-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db
```

#### Verify the db pods are deployed: ####

```bash
✗ kubectl get pods -n spring-petclinic 
NAME                                 READY   STATUS    RESTARTS   AGE
customers-db-mysql-master-0          1/1     Running   0          11m
customers-db-mysql-slave-0           1/1     Running   0          11m
vets-db-mysql-master-0               1/1     Running   0          11m
vets-db-mysql-slave-0                1/1     Running   0          11m
visits-db-mysql-master-0             1/1     Running   0          11m
visits-db-mysql-slave-0              1/1     Running   0          11m
```

4. #### Deploy The Petclinc deployments services

```
kubectl apply -f k8s/api-gateway-deployment.yaml
kubectl apply -f k8s/customers-service-deployment.yaml
kubectl apply -f k8s/vets-service-deployment.yaml
kubectl apply -f k8s/visits-service-deployment.yaml

```

#### Verify that all the pods are deployed and running ####

```bash
✗ kubectl get pods -n spring-petclinic 
NAME                                 READY   STATUS    RESTARTS   AGE
api-gateway-585fff448f-q45jc         1/1     Running   0          4m20s
customers-db-mysql-master-0          1/1     Running   0          11m
customers-db-mysql-slave-0           1/1     Running   0          11m
customers-service-5d7d686654-kpcmx   1/1     Running   0          4m19s
vets-db-mysql-master-0               1/1     Running   0          11m
vets-db-mysql-slave-0                1/1     Running   0          11m
vets-service-85cb8677df-l5xpj        1/1     Running   0          4m2s
visits-db-mysql-master-0             1/1     Running   0          11m
visits-db-mysql-slave-0              1/1     Running   0          11m
visits-service-654fffbcc7-zj2jw      1/1     Running   0          4m2s
wavefront-proxy-dfbd4b695-fdd6t      1/1     Running   0          14m
```

### Petclinic Should Be UP !! ###


Back to Main [README](./README.md)