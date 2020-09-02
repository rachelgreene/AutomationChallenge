pipeline{
    agent any
    stages{
        stage('Git Checkout'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'Git_cred', url: 'https://github.com/sitalprusty/AutomationChallenge.git']]])
            }

        }
        stage('Printing Hello World Sital Prusty'){
            steps{
                
                sh """
                echo "Hello , how are you doing Sheetal?"
		pwd
		ls -ltr
		kubectl get pods --kubeconfig=config
                kubectl apply -f elasticstack/elasticsearch.yml --kubeconfig=config
                kubectl apply -f elasticstack/kibana.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-configmap.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-role-binding.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-service-account.yml --kubeconfig=config
                kubectl apply -f elasticstack/filebeat-daemonset.yml --validate=false --kubeconfig=config
		echo "Check Kibana in browser"
                """
                
            }

        }
    }

    
}
