pipeline {
    agent {
        docker {
            image 'hashicorp/terraform:1.9.5'
            args '--entrypoint=""'
        }
    }
    parameters{
        choice(name: 'action', choices:['Select', 'Apply','Destroy'], description: 'Terraform actions')
    }
    environment {
        AWS_ACCESS_KEY_ID= credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_REGION = 'us_west-2'
    }
    stages {
        stage('terraform') {
            steps {
                sh 'terraform --version'
                sh 'terraform init'
            }
        }
        stage('apply') {
            when {
                expression {
                    return params.action == 'apply'
                }
            }
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
        stage('destroy') {
            when {
                expression {
                    return params.action == 'destroy'
                }
            }
            steps {
                sh 'terraform destroy -auto-approve'
            }
        }     
    }
}