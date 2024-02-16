@Library('shared-library-jenkins') _

pipeline {
    agent any

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
    }
}
