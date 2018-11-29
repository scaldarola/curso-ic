            sh "git tag ${env.VERSION}"
            sh "git push --tags"
                description: '',
                name: 'Release'
               ]
              ]
            }

           } catch (err) {
            result = false
            println "Timeout for merge deploy to staging"
           }
         }
      }
  }

 }
 post {
  always {
   junit 'integration-test/newman/*.xml'
    deleteDir()
  }
  /*failure {

          slackSend ( channel:SLACK_CHANNEL,
                      color: '#ff0000',
                      message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")

          emailext (
            subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
            body: """<p>FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
              <p>Check console output at &QUOT;<a href='${env.BUILD_URL}'>${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>&QUOT;</p>""",
            to: MAIL
       )
   }*/
 }
}
pipeline {
    agent any
    triggers {
        pollSCM('H/2 * * * *')
    }
    stages {
        stage('Build') {
         steps {
             println 'aca va el build'

         }
         post{
            always{

                println "ava se exportan los resultados de los test unitarios"
            }
         }

        }
        stage('Deploy') {
          steps {
              println 'aca va el deploy'
          }
        }
        stage('Verify') {
           steps {
               println 'aca va el verify'
           }
           post{
               always{

                   println "aca se exportan los resultados de los test de aceptación"
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