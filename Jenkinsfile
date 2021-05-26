pipeline{
    agent any

    stages{
        stage("Build"){
            steps{
                echo "compiling and packaging"
                sh 'mvn clean package'
            }
            
        }
        stage('Deploy WAR') {
            steps([$class: 'BapSshPromotionPublisherPlugin']) {
                sshPublisher(
                    continueOnError: false, failOnError: true,
                    publishers: [
                        sshPublisherDesc(
                            configName: "web1",
                            verbose: true,                            
                            transfers: [
                                                               
                                sshTransfer(sourceFiles: "**/*.war", removePrefix: "target"),
                                sshTransfer(execCommand: "sudo cp /home/azadmin/*.war /opt/tomcat/webapps ")
                                
                            ]
                        )   
                    ]
                )
           }
        }
    }
 
}