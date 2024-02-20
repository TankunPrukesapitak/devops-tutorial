pipeline {
	environment {
		// test variable: 0=success, 1=fail; must be string test
		doError = '0'
		BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
	}
	agent any
	stages {
		stage('Build and Push Docker Image') {
			when { expression { env.BRANCH_NAME != 'master' } }
			steps {
				script{
					env.VERSION = "v0.0.${BUILD_NUMBER}"
					sh('''
						echo =================Build and Push Docker Image==========================
						sudo docker build -t testapi:${VERSION} -f TestingAPI/Dockerfile .
						sudo docker tag testapi:${VERSION} tankunprukesapitak/testapi:${VERSION}
						sudo docker push tankunprukesapitak/testapi:${VERSION}
					''')
				}
			}
		}
		stage('Deploy To Kubernetes') {
			when { expression { env.BRANCH_NAME != 'master' } }
			steps {
				script {
					withKubeConfig(credentialsId: "kubeconfig") {
					sh('''
						echo =================Deploy To Kubernetes==========================
						cat k8s/testing-api-deploy.yaml | envsubst | kubectl apply -f -
						kubectl apply -f k8s/testing-api-svc.yaml
						sleep 10
						echo "Deploy Version:${VERSION}"
					''')
					}
				}
			}
		}


	}
}