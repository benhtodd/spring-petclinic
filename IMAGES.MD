There are five container images, that represent microservises needed to deploy this version of the Spring Boot Petclinic App

- customers-service
- vets-service
- visits-service
- admin-server
- config-server
- api-gateway

#### Getting the images

I've built three scripts for pulling, retaging, and pushing the images needed for this demo from my dockerhub "benhtodd" and into your own repo, dockerhub harbor etc. 

The sceripts are rudamentary but they will get the job done. 

#### The Convention used is as follows
- **SRC_PREFIX=** i.e. benhtodd
- **SRC_IMAGE_TAG=** In my dockerhub I will only have one version so it's always 1.0 not latest.
- **TAR_PREFIX=** Where do you want to send the image. For example harbor uses host and repo name so an example might be "harbor.local/petclinic"
- **TAR_IMAGE_TAG=** I leave your version tagging up to you of course

The script files can be found in ./sprintg-petclinic/scripts  
- pullImages.sh
- retagImages.sh
- pushImages.sh

Creative names I know.