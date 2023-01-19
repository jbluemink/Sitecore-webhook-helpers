# escape=`

ARG PARENT_IMAGE
ARG SHS_IMAGE

FROM ${SHS_IMAGE} as shs
FROM ${PARENT_IMAGE}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Add headles module
COPY --from=shs C:\module\db C:\resources\jss
