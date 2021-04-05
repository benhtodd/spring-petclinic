


```
sudo curl -L -o /tmp/velero.tar.gz https://github.com/vmware-tanzu/velero/releases/download/v1.5.1/velero-v1.5.1-linux-amd64.tar.gz 
sudo tar -C /tmp -xvf /tmp/velero.tar.gz
sudo mv /tmp/velero-v1.5.1-linux-amd64/velero /usr/local/bin/velero
sudo chmod +x /usr/local/bin/velero

velero --help
```