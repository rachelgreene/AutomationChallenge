def NAMESPACE = "test"

pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Git_cred', url: 'https://github.com/rachelgreene/AutomationChallenge.git']]])
            }

        }
        stage('Printing Hello World Sheetal'){
            steps{
                
                sh """
                echo "Hello , how are you doing Sheetal?"
		pwd
		ls -ltr
		kubectl get pods --kubeconfig=config
                kubectl create namespace ${NAMESPACE} || true --kubeconfig=config
		kubectl get pods --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/elasticsearch.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/kibana.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-configmap.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role-binding.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-service-account.yml --namespace=${NAMESPACE} --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-daemonset.yml --namespace=${NAMESPACE} --validate=false --kubeconfig=config
#		chmod +x elasticstack/test/check_elasticsearch_data_flow.sh
#                ./elasticstack/test/check_elasticsearch_data_flow.sh
                """
                
            }

        }
    }

    
}
