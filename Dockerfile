FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 

RUN Install-Package nuget.commandline -RequiredVersion 4.9.2 -Force; 
