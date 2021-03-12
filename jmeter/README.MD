```
wget https://mirrors.gigenet.com/apache//jmeter/binaries/apache-jmeter-5.4.1.zip
unzip apache-jmeter-5.4.1.zip
```


````
sudo mv apache-jmeter-5.4.1 /opt/
sudo ln -s /opt/apache-jmeter-5.4.1/bin/jmeter /usr/local/bin/jmeter
```
sudo mv jmeter-plugins-manager-1.6.jar /opt/apache-jmeter-5.4.1/lib/ext


```
jmeter -t ./spring-petclinic/jmeter/petclinic_test_plan.jmx
```


