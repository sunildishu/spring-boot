@Library('shared-library-jenkins') _

pipeline {
    agent any
    environment {
        registry = "670855725719.dkr.ecr.ap-south-1.amazonaws.com/junkinsrepo"
    }

    stages {
        stage('Git Checkout') {
            steps {
                script {
                    gitCheckout(
                        branch: "main",
                        url: "https://github.com/sunildishu/spring-boot.git"
                    )
                }
            }
        }
        
        stage('Unit Test Maven') {
            steps {
                script {
                    mvnTest()
                }
            }
        }
        stage('Integration Test maven') {
            
            steps {
                script {
                    mvnIntegrationTest()
                }
            }
        }
        stage('Static code analysis: Sonarqube'){
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonar-token'
                   statiCodeAnalysis(SonarQubecredentialsId)
               }
            }
        }
        stage('Quality Gate Status Check : Sonarqube'){
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonar-token'
                   QualityGateStatus(SonarQubecredentialsId)
               }
            }
        }
        stage('Maven Build : maven'){
            steps{
               script{
                   
                   mvnBuild()
               }
            }
        }
        stage('Building image') {
            steps {
               script {
                   dockerImage = docker.build("${registry}")
             }
          }
       }
        stage('Docker Image Scan: trivy') {
           steps {
              script {
            // Define the Docker image to be scanned
                  def imageName = "${registry}"
            
            // Execute Trivy scan on the Docker image
                  sh "trivy image ${imageName}"
            }
          }
       }
        stage('Pushing to ECR') {
           steps {
               dockerImagePush()
               }
            }
      stage('K8S Deploy') {
         steps {
          script {
            withKubeConfig([credentialsId: 'kubecred', serverUrl: '']) {
                def yamlFiles = sh(returnStdout: true, script: "ls /kubernatemanifest/*.yaml").trim()
                if (yamlFiles) {
                    sh 'kubectl apply -f ./kubernatemanifest/*.yaml'
                } else {
                    echo "No YAML files found in /kubernatemanifest/"
                }
            }
        }
    }
}
    }
}
    
