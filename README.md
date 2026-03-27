# jenkins_pipeline_submission_March_26_for_continuation
# New Jenkins server test with terraform deployment and triggers

## Jenkinsfile

A simple declarative Jenkinsfile
- Clones git repo
- Binds AWS IAM user creds in terraform stages with AWS Creds plugin
- Stages for terraform init and apply
- Destroy stage using user input

## Terraform Script
- A simple AWS S3 bucket is deployed
- State file  is stored in S3 backend
- S3 bucket name uniqueness is guaranteed

## User Data
EC2 startup script to bootstrap Jenkins Server
