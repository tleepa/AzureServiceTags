# Azure Service Tags

## Local hosting with podman

```bash
# build
podman build -t azure-service-tags:local .

# run with persistent cache
podman run -d --name azure-service-tags -p 8080:8080 -v azure-service-tags-cache:/app/DownloadCache azure-service-tags:local
```

## About

A web application that helps with Azure IP ranges and Service Tags. See [https://azservicetags.azurewebsites.net/](https://azservicetags.azurewebsites.net/).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

