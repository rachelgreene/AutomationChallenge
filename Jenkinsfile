def NAMESPACE = "test"

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
                kubectl create namespace ${NAMESPACE} || true
                kubectl apply -f elasticstack/elasticsearch.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/kibana.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/filebeat-configmap.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/filebeat-role.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/filebeat-role-binding.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/filebeat-service-account.yml --namespace=${NAMESPACE}
                kubectl apply -f elasticstack/filebeat-daemonset.yml --namespace=${NAMESPACE}
                ./elasticstack/test/check_elasticsearch_data_flow.sh
                """
                
            }

        }
    }

    
}
