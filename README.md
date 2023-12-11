## Checkout, Setup, Publish and Deploy dotnet project
Using a modified version of [rasmusbuchholdt/simply-web-deploy](https://github.com/rasmusbuchholdt/simply-web-deploy).

### Example
Place the following in `/.github/workflows/main.yml`
```yml
name: Build project and deploy to Simply
on: [push]

jobs:
  checkout_setup_publish_and_deploy:
    name: Checkout, Setup, Publish and Deploy
    runs-on: windows-latest
    steps:
      - name: Deploy
        uses: aarhusit/deploy@main
        with:
		  csproj-filepath: Solutionname\Projectname.csproj
          website-name: 'Default Website'
          server-computer-name: 'https://server-computer-name.com:8172'
          server-username: 'username'
          server-password: ${{ secrets.PASSWORD }}
```

---
