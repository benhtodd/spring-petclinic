```
wget https://mirrors.gigenet.com/apache//jmeter/binaries/apache-jmeter-5.4.1.zip
unzip apache-jmeter-5.4.1.zip
```

wget https://github.com/spring-petclinic/spring-petclinic-cloud/blob/master/spring-petclinic-api-gateway/src/test/jmeter/petclinic_test_plan.jmx

sudo mv apache-jmeter-5.4.1 /opt/
sudo ln -s /opt/apache-jmeter-5.4.1/bin/jmeter /usr/local/bin/jmeter


jmeter -t
jmeter -t ./spring-petclinic-api-gateway/src/test/jmeter/petclinic_test_plan.jmx
sudo mv jmeter-plugins-manager-1.6.jar /opt/apache-jmeter-5.4.1/lib/ext

jmeter -t ./spring-petclinic-api-gateway/src/test/jmeter/petclinic_test_plan.jmx

