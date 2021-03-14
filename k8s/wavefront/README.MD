Use Helm to install the wavefront proxy

Add the wavefront repository and update helm on your machine

'''
helm repo add wavefront https://wavefronthq.github.io/helm/ && helm repo update
'''

Now we can run the helm chart to deploy the wwavefront-proxy


'''
helm install wavefront wavefront/wavefront --namespace <namespace> \
    --set clusterName=<cluster name> \
    --set wavefront.url=https://<your wavfront url>.wavefront.com \
    --set wavefront.token=4<your user token from wavefront> \
    --set proxy.traceZipkinApplicationName=<name of app label for tracing> \
    --set proxy.zipkinPort=9411 \
    --set collector.logLevel=info
'''

Add the following line if your are deploying to TKGs 

```
--set projectPacific.enabled=true \
```