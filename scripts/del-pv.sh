k delete pvc data-customers-db-mysql-master-0 -n spring-petclinic
k delete pvc data-customers-db-mysql-slave-0 -n spring-petclinic
k delete pvc data-vets-db-mysql-master-0 -n spring-petclinic
k delete pvc data-vets-db-mysql-slave-0 -n spring-petclinic
k delete pvc data-visits-db-mysql-master-0 -n spring-petclinic
k delete pvc data-visits-db-mysql-slave-0 -n spring-petclinic


k delete pv data-customers-db-mysql-master-0
k delete pv data-customers-db-mysql-slave-0
k delete pv data-vets-db-mysql-master-0
k delete pv data-vets-db-mysql-slave-0
k delete pv data-visits-db-mysql-master-0
k delete pv data-visits-db-mysql-slave-0



helm install vets-db-mysql bitnami/mysql --namespace spring-petclinic --version 6.14.3 --set db.name=service_instance_db --set auth.rootPassword="VMware1!" --set auth.username="vmware" --set auth.password="VMware1!"
helm install visits-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db  --set auth.rootPassword=
helm install customers-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db --set auth.rootPassword=


helm uninstall customers-db-mysql -n spring-petclinic
helm uninstall vets-db-mysql -n spring-petclinic
helm uninstall visits-db-mysql -n spring-petclinic


helm install vets-db-mysql bitnami/mysql --namespace spring-petclinic --version 6.14.3 --set db.name=service_instance_db
helm install visits-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db
helm install customers-db-mysql bitnami/mysql --namespace spring-petclinic  --version 6.14.3 --set db.name=service_instance_db


kubectl create secret generic wavefront -n spring-petclinic --from-literal=wavefront-url=https://https://longboard.wavefront.com/ --from-literal=wavefront-api-token=40e8df97-34b4-4946-a10d-f61f8e6888c7

