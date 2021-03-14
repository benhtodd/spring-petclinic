## The Point

Of this project is to supply an easy Microservices Tracing Demo for Tanzu Observability Powered by Wavefront

It should be deployable to any kubernetes environment, minikube, AKS, TKG, etc.

That said, a TKGs (Tanzu Kubernetes Grid on vSphere 7) was used during the development of this project, so some things may not match what you see exactly in your environment.

Steps to Deploy the Demo

1. #### Grab the Containers Images ####

Open [IMAGES.MD](./IMAGES.MD) for instructions on grabbing the container images

2. #### Modify deployment yaml files for your needs ####

Open [CHANGES.MD](./CHANGES.MD) for those details


3. #### Deploy the application ####

Open [DEPLOYAPP.MD](./DEPLOYAPP.MD) for step by step on deploying the application to kubernetes



```

Get the `EXTERNAL-IP` of the API Gateway:

```
✗ kubectl get svc -n spring-petclinic api-gateway 
NAME          TYPE           CLUSTER-IP    EXTERNAL-IP      PORT(S)        AGE
api-gateway   LoadBalancer   10.7.250.24   34.1.2.22   80:32675/TCP   18m
```

Browse to api-gateway EXTERNAL-IP in your browser and see the application running.

![Petclinic App Main Page](./readme-png/petclinic.app.png)

The goal of this demo is to get Tracing data into Tanzu Observability by Wavefront

Before we Open Wavefront to look at the traces being sent, lets use a jmeter test plan to make some microservices pathways lite up

Open [The jmeter README](./jmeter/README.MD) for this demo


After you have jemeter running and see some new data show up in the petclinic app browse to api-gateway IP in your browser and see the application running.

You should also see monitoring and traces from Wavefront under the application name `spring-petclinic-k8s`:

![Wavefront dashboard scree](./readme-png/wavefront-k8s.png)


Access the one-time URL you received when bootstraping Wavefront to see Zipkin traces and other monitoring of your microservices:

![Wavefront dashboard scree](./readme-png/wavefront-summary.png)

Since we've included `brave.mysql8` in our `pom.xml`, the traces even show the various DB queries traces:

![Wavefront dashboard scree](./readme-png/wavefront-traces.png)




## Custom metrics monitoring

Grafana and Prometheus are included in the `docker-compose.yml` configuration, and the public facing applications
have been instrumented with [MicroMeter](https://micrometer.io) to collect JVM and custom business metrics.

A JMeter load testing script is available to stress the application and generate metrics: [petclinic_test_plan.jmx](spring-petclinic-api-gateway/src/test/jmeter/petclinic_test_plan.jmx)

![Grafana metrics dashboard](readme-png/grafana-custom-metrics-dashboard.png)

### Using Prometheus

* Prometheus can be accessed from your local machine at http://localhost:9091

### Using Grafana with Prometheus

* An anonymous access and a Prometheus datasource are setup.
* A `Spring Petclinic Metrics` Dashboard is available at the URL http://localhost:3000/d/69JXeR0iw/spring-petclinic-metrics.
You will find the JSON configuration file here: [docker/grafana/dashboards/grafana-petclinic-dashboard.json]().
* You may create your own dashboard or import the [Micrometer/SpringBoot dashboard](https://grafana.com/dashboards/4701) via the Import Dashboard menu item.
The id for this dashboard is `4701`.

### Custom metrics
Spring Boot registers a lot number of core metrics: JVM, CPU, Tomcat, Logback... 
The Spring Boot auto-configuration enables the instrumentation of requests handled by Spring MVC.
All those three REST controllers `OwnerResource`, `PetResource` and `VisitResource` have been instrumented by the `@Timed` Micrometer annotation at class level.

* `customers-service` application has the following custom metrics enabled:
  * @Timed: `petclinic.owner`
  * @Timed: `petclinic.pet`
* `visits-service` application has the following custom metrics enabled:
  * @Timed: `petclinic.visit`
