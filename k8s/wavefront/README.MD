We are going to use Helm to install the wavefront proxy

First create a namespace to deploy the proxy to

'''
kubectl create namespace wavefront
'''

Next add the wavefront repository and update helm on your machine

'''
helm repo add wavefront https://wavefronthq.github.io/helm/ && helm repo update
'''

Now we can run the helm chart to deploy the wwavefront-proxy


'''
helm install wavefront wavefront/wavefront --namespace <naemspace> \
    --set clusterName=<cluster name> \
    --set wavefront.url=https://longboard.wavefront.com \
    --set wavefront.token=4<your user token from wavefront> \
    --set projectPacific.enabled=true \
    --set proxy.traceZipkinApplicationName=<name of app label for tracing> \
    --set proxy.zipkinPort=9411 \
    --set collector.logLevel=info
    '''