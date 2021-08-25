[Contents](contents.md)

# Documentation: Build

The shell scripts must be run with one the following arguments (using cf01.sh as an example):

```
sh cf01.sh create
sh cf01.sh update
sh cf01.sh delete
```

## Build process

**1: Pre-requisites**

**2: cfg.sh**

**3: cf01.sh**: Create VPC.
 
**4: cf02.sh**: Create public S3 bucket for serving static web files. 

**5: cf03.sh**: Create private S3 bucket for storing scripts, files, keys etc. 

**6: cf04.sh**: Create web server instance. This instance is intended for testing the server build process and correct functioning. 

**7: cf05.sh**: Create encrypted EFS filestorage, depending on the architecture (may not be required).

**8: cf06.sh**: Create Cloud9 management instance in the VPC created in ```cfg01.sh```.

**9: cf07.sh**: Create load-balancer and configure autoscaling.
