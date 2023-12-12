## Checkout, Setup, Publish and Deploy dotnet project
Using a modified version of [rasmusbuchholdt/simply-web-deploy](https://github.com/rasmusbuchholdt/simply-web-deploy).
Where all steps from Checkout to Deploy is included.

---

# Example
#### Checkout, Publish and Deploy to SmarterASP.NET

Automatically deploy your net core project to SmarterASP.NET.
The job do:
1. git checkout default branch
2. dotnet setup (optional)
3. dotnet publish
4. Stop Application Pool (optional)
5. Deploy Application
6. Start Application Pool (optional)

Place the following in `/.github/workflows/main.yml`
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

#### Adding secrets to Github
On GitHub, get on your repository’s page
- Click Settings > Secrets and variables > Actions > New repository secret
- Give a name to your secret (eg PASSWORD)
- Enter the value of your secret
- Click Add secret

You can now use the secret as ${{secrets.*}} in your main.yml

