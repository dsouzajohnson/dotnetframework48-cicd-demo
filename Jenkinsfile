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
 
	stage('Build') 
	{
		steps 
		{
			"\"${tool 'MSBuild'}\" dotnetframework48-cicd-demo.sln /p:Configuration=Release /p:PlatformTarget=Any CPU" 
		}
	}

		}
	}
