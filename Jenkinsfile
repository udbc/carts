pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Compilation'
        sh 'mvn compile'
      }
    }

    stage('Validate') {
      steps {
        echo 'Validation'
        sh 'mvn clean test'
      }
    }

    stage('Package') {
      steps {
        echo 'Packaging'
        sh 'mvn package -DskipTests'
      }
    }

    stage('Archival') {
      steps {
        echo 'Archiving'
        archiveArtifacts '**/target/*.jar'
      }
    }

  }
  environment {
    maven = 'Maven3.6.3'
  }
}