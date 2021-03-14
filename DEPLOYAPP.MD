### Setting things up in Kubernetes

We will need to create some namespaces, and while we are at it we can create the services the petclinc app uses. For convienence we have put them all in one folder call init-app

Remember to modify 02-config-map.yaml as described in [CHANGES.MD](./CHANGES.MD)

```
kubectl apply -f k8s/init-app/ 
```
### Verify Environent so far

Verify the namespace creation

```
✗  k get ns
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


Verify the services are available:

```
✗ kubectl get svc -n spring-petclinic
NAME                TYPE           CLUSTER-IP     EXTERNAL-IP   PORT(S)             AGE
api-gateway         LoadBalancer   10.7.250.24    <pending>     80:32675/TCP        36s
customers-service   ClusterIP      10.7.245.64    <none>        8080/TCP            36s
vets-service        ClusterIP      10.7.245.150   <none>        8080/TCP            36s
visits-service      ClusterIP      10.7.251.227   <none>        8080/TCP            35s
wavefront-proxy     ClusterIP      10.7.253.85    <none>        2878/TCP,9411/TCP   37s
```

### Deploy Wavefront Proxy to Cluster in wavefront namespace

We are going to use Helm to install the wavefront proxy.

We have already create the wavefront namespace so now we need to add the wavefront repository and update helm on your machine

```
helm repo add wavefront https://wavefronthq.github.io/helm/ && helm repo update
```

Now we can run the helm chart to deploy the wwavefront-proxy

```
helm install wavefront wavefront/wavefront --namespace wavefront \
    --set clusterName=<your student id> \
    --set wavefront.url=https://longboard.wavefront.com \
    --set wavefront.token=<wavefront token> \
    --set projectPacific.enabled=true \
    --set proxy.traceZipkinApplicationName=spring-petclinic \
    --set proxy.zipkinPort=9411 \
    --set collector.logLevel=info
```

### Settings up databases with helm

We'll now need to deploy our databases. For that, we'll use helm again.

Make sure you have a single `default` StorageClass in your Kubernetes cluster:

```
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
