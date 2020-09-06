FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
ARG buildNumber=
ENV buildNumber=$buildNumber
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY ATBot/*.csproj ./ATBot/
RUN dotnet restore -p:VersionSuffix=$buildNumber

# copy everything else and build app
COPY ATBot/. ./ATBot/
WORKDIR /app/ATBot
RUN dotnet publish -p:VersionSuffix=$buildNumber -c Release -o out

FROM mcr.microsoft.com/dotnet/core/runtime:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/ATBot/out ./
ENTRYPOINT ["dotnet", "ATBot.dll"]
