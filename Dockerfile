FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8-windowsservercore-ltsc2019

# Set up environment to collect install errors.
COPY Install.cmd C:\\TEMP\
ADD https://aka.ms/vscollect.exe C:\\TEMP\\collect.exe

# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/15/release/channel
ADD ${CHANNEL_URL} C:\\TEMP\\VisualStudio.chman

# Download and install Build Tools for Visual Studio 2017.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\\TEMP\\vs_buildtools.exe
RUN C:\\TEMP\\Install.cmd C:\\TEMP\\vs_buildtools.exe --quiet --wait --norestart --nocache `
