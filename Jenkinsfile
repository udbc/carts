/*CartsJenkinsPipeline
This Jenkins file will run in jenkins environment and creates and artifact carts.jar 
available in /targets/ folder
*/

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
  tools{
       maven 'Maven3.6.3' 
    }
}
