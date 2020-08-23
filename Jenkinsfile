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
                kubectl create namespace test || true --kubeconfig=config
                kubectl apply -f elasticstack/elasticsearch.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/kibana.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-configmap.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role-binding.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-service-account.yml --namespace=test --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-daemonset.yml --namespace=test --kubeconfig=config
                ./elasticstack/test/check_elasticsearch_data_flow.sh
                """
                
            }

        }
    }

    
}
