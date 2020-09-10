FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build

# Download the Build Tools bootstrapper.
ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe

WORKDIR /app

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]



# Install Build Tools with the Microsoft.VisualStudio.Workload.AzureBuildTools workload, excluding workloads and components with known issues.
RUN C:\TEMP\vs_buildtools.exe 

# Define the entry point for the docker container.
# This entry point starts the developer command prompt and launches the PowerShell shell.
ENTRYPOINT ["C:\\BuildTools\\Common7\\Tools\\VsDevCmd.bat", "&&", "powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

# copy csproj and restore as distinct layers
COPY *.sln .
COPY dotnetframework48-cicd-demo/*.csproj ./dotnetframework48-cicd-demo/
COPY dotnetframework48-cicd-demo/*.config ./dotnetframework48-cicd-demo/
#RUN nuget restore

# copy everything else and build app
COPY dotnetframework48-cicd-demo/. ./dotnetframework48-cicd-demo/
WORKDIR /app/dotnetframework48-cicd-demo
RUN msbuild /p:Configuration=Release


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/dotnetframework48-cicd-demo/. ./
