FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set up environment to collect install errors.

COPY Install.cmd .


# Download and install Build Tools for Visual Studio 2017.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\\TEMP\\vs_buildtools.exe
RUN Install.cmd C:\\TEMP\\vs_buildtools.exe --quiet --wait --norestart --nocache `
