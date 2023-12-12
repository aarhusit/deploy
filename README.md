## Checkout, Setup, Publish and Deploy dotnet project
Using a modified version of [rasmusbuchholdt/simply-web-deploy](https://github.com/rasmusbuchholdt/simply-web-deploy).

### Example
Place the following in `/.github/workflows/main.yml`
```yml
name: Build and deploy
on:
  push:
    branches:
      - main

jobs:
  checkout_publish_and_deploy:
    name: Checkout, Publish and Deploy
    runs-on: windows-latest
    steps:
      - name: Deploy
        uses: aarhusit/deploy@main
        with:
          csproj-filepath:      Solutionname\Projectname.csproj
          website-name:         Default Website
          server-computer-name: https://server-computer-name.com:1234
          server-username:      username
          server-password:      ${{secrets.PASSWORD}}
```

---
