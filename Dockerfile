FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set up environment to collect install errors.
COPY Install.cmd C:\TEMP\
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

Download and install Build Tools for Visual Studio 2017.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\TEMP\VisualStudio.chman `
    --installChannelUri C:\TEMP\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.ManagedDesktopBuildTools `
    --add Microsoft.Net.Component.3.5.DeveloperTools `
    --add Microsoft.Net.ComponentGroup.4.6.2.DeveloperTools `
    --add Microsoft.Net.ComponentGroup.TargetingPacks.Common `
    --add Microsoft.VisualStudio.Component.TestTools.BuildTools `
    --add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.WinXP `
    --add Microsoft.VisualStudio.Workload.NodeBuildTools `
    --add Microsoft.VisualStudio.Component.TypeScript.2.8 `
    --add Microsoft.VisualStudio.Workload.NetCoreBuildTools `    
    --add Microsoft.VisualStudio.Workload.WebBuildTools `
    --add Microsoft.VisualStudio.Workload.VCTools `
    --add Microsoft.VisualStudio.Workload.UniversalBuildTools `
    --add Microsoft.VisualStudio.Workload.MSBuildTools `
    --add Microsoft.VisualStudio.Workload.DataBuildTools
    
    
    SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
    
    
    # Install WebDeploy and NuGet with Chocolatey
RUN Install-PackageProvider -Name chocolatey -RequiredVersion 2.8.5.130 -Force; `
    Install-Package -Name nodejs.install -RequiredVersion 11.6.0 -Force; `
    Install-Package -Name webdeploy -RequiredVersion 3.6.0 -Force; `
    Install-Package nuget.commandline -RequiredVersion 4.9.2 -Force; 
    
    
