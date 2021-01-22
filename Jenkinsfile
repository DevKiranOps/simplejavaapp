pipeline{
    agent any

    stages{
        stage("test"){
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
                                sshTransfer(execCommand: "echo 'Hello World' "),
                                sshTransfer(sourceFiles: "**/*.war",)
                                sshTransfer(removePrefix: "target")
                                
                            ]
                        )
                    ]
                )
           }
        }
    }
 
}