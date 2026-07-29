# Verified from: Microsoft Learn - Tutorial: Containerize a .NET app; Microsoft Learn - Default ASP.NET Core port changed from 80 to 8080
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

COPY AzureServiceTags.WebApp/AzureServiceTags.WebApp.csproj AzureServiceTags.WebApp/
RUN dotnet restore AzureServiceTags.WebApp/AzureServiceTags.WebApp.csproj

COPY . .
RUN dotnet publish AzureServiceTags.WebApp/AzureServiceTags.WebApp.csproj -c Release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS final
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:8080 \
    DOTNET_EnableDiagnostics=0

EXPOSE 8080

COPY --from=build /app/publish .
RUN mkdir -p /app/DownloadCache && chown -R app:app /app
USER app

ENTRYPOINT ["dotnet", "AzureServiceTags.WebApp.dll"]
