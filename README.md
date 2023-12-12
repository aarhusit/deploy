## Checkout, Setup, Publish and Deploy dotnet project
Using a modified version of [rasmusbuchholdt/simply-web-deploy](https://github.com/rasmusbuchholdt/simply-web-deploy).
Where all steps from Checkout to Deploy is included.

---

# Examples
#### Checkout, Publish and Deploy to SmarterASP.NET

Automatically deploy your net core project to SmarterASP.NET.
The job do:
1. git checkout default branch
2. dotnet setup (optional)
3. dotnet publish
4. Stop Application Pool (optional)
5. Deploy Application
6. Start Application Pool (optional)

```yml
name: Publish via Web Deploy to smarterasp.net

on:
  push:
    branches:
      - main

jobs:
  checkout_publish_and_deploy:
    name: Checkout, Publish and Deploy to SmarterASP.NET
    runs-on: windows-latest
    steps:
      - name: Deploy to SmarterASP.NET
        uses: aarhusit/deploy@main
        with:
          csproj-filepath:      Solutionname\Projectname.csproj
          website-name:         username-001-site1
          server-computer-name: https://win1234.site4now.net:8172
          server-username:      username-001
          server-password:      ${{secrets.PASSWORD}}
```