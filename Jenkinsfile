pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        echo 'this is the build job'
        sh 'mvn compile'
      }
    }

    stage('Test') {
      steps {
        echo 'this is the test job'
        sh 'mvn clean test'
      }
    }

    stage('Package') {
      steps {
        echo 'this is the package job'
        sh 'mvn package -DskipTests'
      }
    }

    stage('Archive') {
      steps {
        archiveArtifacts '**/target/*.jar'
      }
    }

  }
  tools {
    maven 'Maven 3.9.2'
  }
  post {
    always {
      echo 'this pipeline has completed...'
    }

  }
}