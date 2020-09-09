pipeline {
    agent any
  stages {
			
	  
	  stage ('Checkout')
			{
				steps 
				{
					checkout scm
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
