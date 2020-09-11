podTemplate(label: 'dotnetframework48-cicd-demo', containers: [
    containerTemplate(name: 'dotnetframework', image: 'FROM mcr.microsoft.com/dotnet/framework/sdk:4.8', ttyEnabled: true, command: 'cat')
]) {
    node("dotnetframework48-cicd-demo") {
        stage('Checkout') {
            steps {
                checkout scm

            }
        }

        stage('Nuget Restore') {
            container('dotnetframework') {
                steps {
                    bat label: 'Nuget Restore',
                        script: ''
                    '
                    nuget restore "dotnetframework48-cicd-demo.sln"
                    echo "Nuget Done Starting Msbuild *************"
                    ''
                    ' 
                }
            }
        }

        stage('Build') {
            container('dotnetframework') {
                steps {
                    script {
                        tool name: 'msbuild_2019', type: 'msbuild'
                        bat "\"${tool 'msbuild_2019'}\" dotnetframework48-cicd-demo.sln"
                    }
                }
            }
        }

        stage('UnitTest') {
            steps {
                echo 'Step Unit Test Project'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Step Deploy Project'
            }
        }
    }
}
}
