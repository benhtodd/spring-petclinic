
To install Velero CLI on linux

```
sudo curl -L -o /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.5.1/velero-v1.5.1-linux-amd64.tar.gz 
sudo tar -C /tmp -xvf /tmp/velero.tar.gz
sudo mv /tmp/velero-v1.5.1-linux-amd64/velero /usr/local/bin/velero
sudo chmod +x /usr/local/bin/velero

velero --help
```

With Velero 1.4 you need to annotate the Volume you wish to backup
`
```
kubectl -n YOUR_POD_NAMESPACE annotate pod/YOUR_POD_NAME backup.velero.io/backup-volumes=YOUR_VOLUME_NAME_1,YOUR_VOLUME_NAME_2,...

```

If we run 

```
kubectl get pv -n spring-petclinic
```

We get back 

```❯ k get pvc -n spring-petclinic
NAME                               STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS              AGE
data-customers-db-mysql-master-0   Bound    pvc-0e4f0a4d-ac26-4683-ab7b-9170388a18e2   8Gi        RWO            vsphere-with-kubernetes   24h
data-customers-db-mysql-slave-0    Bound    pvc-6b68dcb4-0d79-4a83-b4e0-3455e41e1d25   8Gi        RWO            vsphere-with-kubernetes   24h
data-vets-db-mysql-master-0        Bound    pvc-dec338e7-0b2a-41a4-8b15-eac6c30d7761   8Gi        RWO            vsphere-with-kubernetes   24h
data-vets-db-mysql-slave-0         Bound    pvc-d6a37363-6c3e-457b-8a26-d3d51985bfcc   8Gi        RWO            vsphere-with-kubernetes   24h
data-visits-db-mysql-master-0      Bound    pvc-d50e54c3-a361-4424-a897-4b4de69061e9   8Gi        RWO            vsphere-with-kubernetes   24h
data-visits-db-mysql-slave-0       Bound    pvc-725bcdb2-b009-4a66-b98b-d1219ae9be63   8Gi        RWO            vsphere-with-kubernetes   24h
```