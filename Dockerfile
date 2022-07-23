# syntax=docker/dockerfile:1
  FROM mcr.microsoft.com/dotnet/aspnet:6.0
  COPY \ App/
  WORKDIR /App
  ENTRYPOINT ["dotnet", "UltimateProxyV2.dll","config/config.json"]
EXPOSE 4444