FROM mcr.microsoft.com/dotnet/framework/sdk:4.8

SHELL ["cmd", "/S", "/C"]

ADD https://aka.ms/vs/16/release/vs_buildtools.exe C:\\Temp\\vs_buildtools.exe
ADD https://aka.ms/vs/16/release/channel C:\\Temp\\VisualStudio.chman
RUN C:\\Temp\\vs_buildtools.exe `
    

