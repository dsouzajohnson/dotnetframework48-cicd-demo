FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app

# Restore the default Windows shell for correct batch processing.
SHELL ["cmd", "/S", "/C"]

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
