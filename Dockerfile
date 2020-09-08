FROM mcr.microsoft.com/powershell
LABEL Maintainer="John McDonough @movinalot" Name=ucs-powertool-core-ms Version=3.0.0.10

RUN pwsh -Command '$ProgressPreference = "SilentlyContinue"; Install-Module Cisco.UcsManager -AcceptLicense -force'
RUN pwsh -Command '$ProgressPreference = "SilentlyContinue"; Install-Module Cisco.UcsCentral -AcceptLicense -force'
RUN pwsh -Command '$ProgressPreference = "SilentlyContinue"; Install-Module Cisco.IMC -AcceptLicense -force'

COPY Start-UcsPowerTool.ps1 /root/.local/share/powershell/Modules/
CMD ["pwsh", "-NoExit", "-File", "/root/.local/share/powershell/Modules/Start-UcsPowerTool.ps1"]
