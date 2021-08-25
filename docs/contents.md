# Documentation: Contents

* [Introduction](intro.md)
* [Pre-requisites](reqs.md)
* [Building the project](build.md)
* [Template 1](cf01.md) (cf01.yaml)
* [Template 2](cf02.md) (cf02.yaml)
* [Template 3](cf03.md) (cf03.yaml)
* [Template 4](cf04.md) (cf04.yaml)
* [Template 5](cf05.md) (cf05.yaml)
* [Template 6](cf06.md) (cf06.yaml)
* [Template 7](cf07.md) (cf07.yaml)
* [Scripts](scripts.md)
* [References](refs.md)

## Template summary

| YAML | Contents |
| ---- | -------- |
| cf01.yaml | Create VPC with two public and two private subnets across two Availability zones. Also create Internet Gateway, route tables, NACLs, Security Groups, Flowlogs bucket and Flowlogs. |
| cf02.yaml | Create public S3 bucket configured to serve static files over HTTPS (ie. a "website"). |
| cf03.yaml | Create encrypted private S3 storage for scripts, files, keys etc. Required to configure automated processes and pipelines, etc. |
| cf04.yaml | Create web server instance. |
| cf05.yaml | Create encrypted EFS filestorage with mount targets in each private subnet. A Security Group protecting the mount targets is created in ```cf01.sh```. This template is optional (depends on final architecture requirements). It is intended to provide shared storage for web application files. |
| cf06.yaml | Create a Cloud9 management instance in the project VPC. |

