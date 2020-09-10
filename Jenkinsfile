pipeline 
{
   environment 
   {
		registry = "dsouzajohnson/dotnetframework48"
		registryCredential =  'dockerhub_id'
		dockerImage = 'mcr.microsoft.com/dotnet/framework/aspnet:4.8'
	}
	agent any
	stages 
	{
		stage ('Checkout')
		{
			steps 
			{
				checkout scm
			}
		}

		stage('Building our image') 
		{
			steps
			{
				script {
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
					}
			}
		}
		stage('Deploy our image') 
		{
			steps
			{
				script 
				{
					docker.withRegistry( '', registryCredential ) 
					{
						dockerImage.push()
					}
				}
			}
		}
		stage('Cleaning up') 
		{
			steps
			{
				sh "docker rmi $registry:$BUILD_NUMBER"
			}
		}
		
	}
}
	

