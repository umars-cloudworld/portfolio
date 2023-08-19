## Contributors
- Muhammad Umar (Host)
# Project-2 - Secure Next.js Web App Deployment on AWS ECS using Terraform and GitHub Actions
#  Author: Muhammad Umar                                        
#  Email : m.umerpervaiz@gmail.com     
![Nextjs Deployment](Project-2.jpg)
                     
### Description

Deployed a secure Next.js web app on AWS ECS using Terraform for infrastructure setup. Strengthened security through IAM, Security Groups, and a well-architected VPC. Implemented efficient CI/CD using GitHub Actions, ensuring automated testing and deployment. Integrated ALB for optimal traffic management, providing a seamless user experience.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Prerequisites

Before getting started, ensure you have the following prerequisites:

- AWS account with permissions to create AWS resources.
- Github Account setup
- Check backend folder


## Usage

Follow these steps to set up the deployment pipeline for your React app:

1. Setup terraform remote state by applying backend folder's configuration files
2. Fork repository and clone it to your local machine using url: https://github.com/umars-cloudworld/nextjs-cicd
3. Use below github actions configuration to deploy the infrastructure in AWS (.github/workflows/aws.yml)

```bash
name: Deploy to Amazon ECS

on:
  push:
    branches:
      - "main"

env:
  AWS_REGION: us-east-1
  ECR_REPOSITORY: nextjs-app
  ECS_SERVICE: nextjs-service
  ECS_CLUSTER: nextjs-cluster
  ECS_TASK_DEFINITION: .github/workflows/task-definition.json
  CONTAINER_NAME: nextjs-app

permissions:
  id-token: write
  contents: read # This is required for actions/checkout@v2

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    environment: production

    steps:
      - name: Checkout
        uses: actions/checkout@v3

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Setup Terraform
        uses: hashicorp/setup-terraform@v1

      - name: Terraform Init
        run: cd infra && terraform init

      - name: Terraform Validate
        run: cd infra && terraform validate

      - name: Terraform Plan
        id: plan
        run: cd infra && terraform plan

      - name: Terraform Apply
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        run: cd infra && terraform apply -auto-approve

``` 
4. Run below command to get task-definition.json 

```bash
aws ecs describe-task-definition \
--task-definition "nextjs-task-def" \
--query taskDefinition > .github/workflows/task-definition.json
```

- Make 2 changes in task-definition.json
* 1st - "taskDefinitionArn" remove colon and revision number
* 2nd - At line number 30 remove "revision": <number> as well.

5. Add below configurations to deploy application on ECS
```bash
      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1

      - name: Build, tag, and push image to Amazon ECR
        id: build-image
        env:
          ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
          IMAGE_TAG: latest
        run: |
          docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
          echo "::set-output name=image::$ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG"

      - name: Fill in the new image ID in the Amazon ECS task definition
        id: task-def
        uses: aws-actions/amazon-ecs-render-task-definition@v1
        with:
          task-definition: ${{ env.ECS_TASK_DEFINITION }}
          container-name: ${{ env.CONTAINER_NAME }}
          image: ${{ steps.build-image.outputs.image }}

      - name: Deploy Amazon ECS task definition
        uses: aws-actions/amazon-ecs-deploy-task-definition@v1
        with:
          task-definition: ${{ steps.task-def.outputs.task-definition }}
          service: ${{ env.ECS_SERVICE }}
          cluster: ${{ env.ECS_CLUSTER }}
          wait-for-service-stability: false #Make it to true, after first deployment
```
# Congrats, My application has been deployed successfully
6. for testing CICD, we can made any changes in the code and we can push to github, and from here, github actions will take care the whole deployment.

## Contributing

Contributions are welcome! If you find any issues or have improvements to suggest, feel free to open a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Contact

For any inquiries or questions, please contact me at [umar@techwithomar.com](mailto:umar@techwithomar.com) or visit my website [https://techwithomar.com/](https://techwithomar.com/).
