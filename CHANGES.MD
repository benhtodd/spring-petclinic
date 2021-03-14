### Change kubernetes deployment files to meet your needs

In the k8s directory you will find all the files you need to deploy the petclininc app. You will have to make some small changes to the yaml files to match yuour environment. 

./spring-petclinic/k8s/init-app - is for "initializing" your cluster for the app to be deployed. The yamls in there create namespaces and create app services needed. There is one file that needs to be modified for your environment.

02-config-map.yaml - has a block 

```
    wavefront:
      application:
        name: <app name>
      freemium-account: true
```
You will want to change the value of **name:** to match what you want reflected in wavefront tracing

In ./spring-petclinic/k8s/ there are four yaml files that will need to be updated to reflect your image repo. *api-gate-deployment.yaml*, *customers-service-deployment.yaml*, *vets-service-deployment.yaml*, and *visits-service-deployment.yaml* all will need to have their Spec -- containers -- image value set to where you pushed the base images to. 