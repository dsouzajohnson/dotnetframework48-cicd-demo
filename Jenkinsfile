pipeline {
    agent any
  stages {
			
	  stage('Clean Workspace')
			{
				steps 
				{
					cleanWs()
				}
			}
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
					  bat "\"${tool 'msbuild_2019'}\"\\msbuild.exe PrimeDotnet\\dotnetframework48-cicd-demo.sln /P:DeployOnBuild=True /p:AllowUntrustedCertificate=True /p:MSDeployServiceUrl=<IP or Hostname of IIS server> /P:DeployIISAppPath=\"Default Web Site/PrimeDotnet\""
					}
				}
			}
	

		}
	}
