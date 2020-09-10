FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build

RUN Install-Package nuget.commandline -RequiredVersion 4.9.2 -Force; 
