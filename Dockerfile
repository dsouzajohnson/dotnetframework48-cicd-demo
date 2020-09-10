FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set up environment to collect install errors.
COPY "Install.cmd" "C:\TEMP\\"
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

#Download and install Build Tools for Visual Studio 2017.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `

    
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
    
    
# Install WebDeploy and NuGet with Chocolatey
RUN Install-PackageProvider -Name chocolatey -RequiredVersion 2.8.5.130 -Force; 
RUN   Install-Package -Name webdeploy -RequiredVersion 3.6.0 -Force; 
RUN    Install-Package nuget.commandline -RequiredVersion 4.9.2 -Force; 
    
    
