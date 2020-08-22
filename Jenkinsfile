pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Git_cred', url: 'https://github.com/rachelgreene/WebehookTest.git']]])
            }

        }
        stage('Printing Hello'){
            steps{
                
                sh """
                echo "Hello , how are you doing Sheetal?"
                """
                
            }

        }
    }

    
}
