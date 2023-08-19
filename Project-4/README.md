## Contributors
- Muhammad Umar (Host)
# Project-4 - GitLab CI/CD Website Deployment on AWS S3 with Terraform
#  Author: Muhammad Umar                                        
#  Email : m.umerpervaiz@gmail.com     
![Nodejs Deployment](Project-images/stages.jpg)

                     

Leveraged  a seamless website deployment using GitLab Pipelines, in conjunction with Terraform for AWS infrastructure management. Employed S3 buckets for secure and efficient website hosting, enhanced by Cloudfront and Route 53 for content delivery and DNS management. The integration of GitLab CI/CD and AWS services ensures an automated, reliable, and scalable website deployment solution.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Prerequisites

Before getting started, ensure you have the following prerequisites:

- AWS account with permissions to create AWS resources.
- GitLab verified Account

## Usage

Follow these steps to set up the deployment pipeline for your React app:
Fork this repository and clone it to your local machine using url: https://gitlab.com/devops5043124/production-nodejs-cicd-pipeline

1. First setup to setup S3 Backend for storing State file for both environments i.e stage, prod, to do this run:
```
make apply-backed
```
2. Validate stage environment terraform configurations by running the following command:

```
make validate-stage
```

3. See Plan of stage environment by running the following command:

```
make plan-stage
```

4. Apply terraform configurations for stage environment by running the following command:

```
make apply-stage
```
## Prod environment provisioning commands
 
2. Validate prod environment terraform configurations by running the following command:

```
make validate-prod
```

3. See Plan of prod environment by running the following command:

```
make plan-prod
```

4. Apply terraform configurations for prod environment by running the following command:

```
make apply-prod
```
![Nodejs Deployment](Project-images/nodejs_cicd_pipeline_using_gitlab.jpg)
## Destroy environments after testing
5. destroy terraform configurations for stage environment by running the following command:

```
make destroy-stage
```
6. destroy terraform configurations for prod environment by running the following command:

```
make destroy-prod
```
7. destroy s3 backend bucket by running the following command:

```
make destroy-backend
```


## Contributing

Contributions are welcome! If you find any issues or have improvements to suggest, feel free to open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any inquiries or questions, please contact me at [umar@techwithomar.com](mailto:umar@techwithomar.com) or visit my website [https://techwithomar.com/](https://techwithomar.com/).
 