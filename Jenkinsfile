pipeline {
  agent any
  stages {
    stage('Compile') {
      steps {
        echo 'Compilation'
        sh 'mvn compile'
      }
    }

    stage('Test') {
      steps {
        sh 'mvn test'
      }
    }

    stage('Package') {
      steps {
        sh 'mvn package -DskipTests'
      }
    }

  }
  tools {
    maven 'Maven3.6.3'
  }
  post {
    always {
      echo 'this pipeline has completed...'
    }

  }
}