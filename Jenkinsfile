pipeline {

    agent any
//    agent {
    
//    label 'SlaveNode1'
    
// }
    environment {
        SOURCE_CREDENTIAL_ID = 'id_rsa'
        SOURCE_CODE_URL = 'https://github.com/colorfulvox/jenkinsdemo.git'
        BRANCH = 'main'
    }

    stages {
        stage('Git Clone') {
            steps {
                git url: "$SOURCE_CODE_URL",
                    branch: "$BRANCH",
                    credentialsId: "$SOURCE_CREDENTIAL_ID"
            }
            
            post {
            success {
                sh 'echo "OK"'
            }
            
            failure {
                sh 'echo "Fail"'
            }
        }

        }
        stage("Build") {
            steps {
                sh 'chmod +x gradlew'
                sh './gradlew clean build'
            }
            
            post {
                success {
                    sh 'echo "OK2"'
                }
                failure {
                    sh 'echo "Fail2"'
                }
            }
            
        }
        
        stage("Deploy") {
            steps {
                sh 'scp -P 22 -i ~/.ssh/id_rsa.pem ./build/libs/jenkinsdemo.jar server@211.48.84.211:~/jenkinsdemo.jar'
            }
            
            post {
                success {
                    sh 'echo "OK3"'
                }
                failure {
                    sh 'echo "Fail3"'
                }
            }
        }


    }
}
