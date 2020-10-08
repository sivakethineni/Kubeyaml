node {
  stage('SCM Checkout') {
    git branch: 'main', url: 'https://github.com/sivakethineni/Kubeyaml.git'
  }
  stage('Apply Kubernetes files'){
      sh 'ls -lrt'
      sh 'chmod +x *'
      sh './aws-temp-credentials.sh'
  }
}
