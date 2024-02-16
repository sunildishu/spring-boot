@Library('shared-library-jenkins') _

pipeline {
    agent any
    environment {
        registry = "785236889276.dkr.ecr.ap-south-1.amazonaws.com/testecr"
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
                   
                   def SonarQubecredentialsId = 'sonartoken'
                   statiCodeAnalysis(SonarQubecredentialsId)
               }
            }
        }
        stage('Quality Gate Status Check : Sonarqube'){
            steps{
               script{
                   
                   def SonarQubecredentialsId = 'sonartoken'
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
    }
}
