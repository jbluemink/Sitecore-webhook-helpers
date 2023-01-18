# escape=`

ARG PARENT_IMAGE
ARG TOOLS_IMAGE
ARG SHS_IMAGE
ARG SOLUTION_IMAGE

FROM ${SOLUTION_IMAGE} as solution
FROM ${TOOLS_IMAGE} as tools
FROM ${SHS_IMAGE} as shs
FROM ${PARENT_IMAGE}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR C:\inetpub\wwwroot

# Copy developer tools and entrypoint
COPY --from=tools C:\tools C:\tools

#Co[de Headless services CD
COPY --from=shs C:\module\cd\content C:\inetpub\wwwroot
COPY --from=shs C:\module\tools C:\module\tools
RUN C:\module\tools\Initialize-Content.ps1 -TargetPath C:\inetpub\wwwroot; `
  Remove-Item -Path C:\module -Recurse -Force;
  
# Copy solution website files
COPY --from=solution \artifacts\website\ .\
