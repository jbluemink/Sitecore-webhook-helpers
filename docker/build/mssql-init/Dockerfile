# escape=`

ARG BASE_IMAGE
ARG SHS_IMAGE

FROM ${SHS_IMAGE} as shs_resources
FROM ${BASE_IMAGE}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Add headles module
COPY --from=SHS_IMAGE C:\module\db C:\resources\jss
