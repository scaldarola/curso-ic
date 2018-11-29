pipeline {
    agent any
    triggers {
        pollSCM('H/2 * * * *')
    }
    stages {
        stage('Build') {
         steps {
              sh "./build.sh"

         }
         post{
            always{

                println "ava se exportan los resultados de los test unitarios"
            }
         }

        }
        stage('Deploy') {
          steps {
               sh "./deploy.sh"
          }
        }
        stage('Verify') {
           steps {
                sh "./verify.sh"
           }
           post{
               always{

                    post{
                         always{
                                 junit 'build/test-results/test/*.xml'
                               }
               }
           }
        }

    }
    post {
        success {
            echo 'El job finalizó OK! :)'
        }
        failure {
            echo 'El job rompio! :('
        }
    }
}