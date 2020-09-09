pipeline {
    agent any
  stages {
			
	  
	stage('Clean Workspace'){
      steps {
        cleanWs()
      }
    }
			stage ('Build')
			{
				steps { 
				
					script {
					  //def msbuild = tool name: 'msbuild_2017', type: 'hudson.plugins.msbuild.MsBuildInstallation'
					  tool name: 'msbuild_2019', type: 'msbuild'
					  bat "\"${tool 'msbuild_2019'}\" dotnetframework48-cicd-demo.sln"
					}
				}
			}
	

		}
	}
