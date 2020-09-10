FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

ADD "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" "C:\windows\nuget.exe"

WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY dotnetframework48-cicd-demo/*.csproj ./dotnetframework48-cicd-demo/
COPY dotnetframework48-cicd-demo/*.config ./dotnetframework48-cicd-demo/
RUN "C:\windows\nuget.exe" restore

# copy everything else and build app
COPY dotnetframework48-cicd-demo/. ./dotnetframework48-cicd-demo/
WORKDIR /app/dotnetframework48-cicd-demo
RUN msbuild /p:Configuration=Release


FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/dotnetframework48-cicd-demo/. ./
    
    
