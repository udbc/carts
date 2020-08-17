pipeline {
  agent {
    docker {
      image 'schoolofdevops/carts-maven'
    }

  }
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
        sh 'mvn compile'
      }
    }

    stage('Test') {
      steps {
        echo 'Testing'
        sh 'mvn clean test'
      }
    }

    stage('Packaging') {
      steps {
        echo 'Packaging....'
        sh 'mvn package -DskipTests'
        archiveArtifacts '**/target/*.jar'
      }
    }

  }
  tools {
    maven 'Maven 3.6.3'
  }
  post {
    always {
      echo 'this pipeline has completed'
    }

  }
}