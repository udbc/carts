pipeline {
    agent any

    tools {
      maven 'Maven 3.6.3'
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
            }
        }
    }
    
    post{
       always{
           echo 'this pipeline has completed'
}
}
}
