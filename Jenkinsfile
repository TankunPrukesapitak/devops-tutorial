pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    	stage('Deploy To Kubernetes') {
  		steps {
    			script {
      				withKubeConfig(credentialsId: "kubeconfig") {
      					sh('''
        					kubectl get no
      					''')
      					}
    				}
  			}
		}

   	 }
}
