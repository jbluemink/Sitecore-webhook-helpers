# escape=`

ARG PARENT_IMAGE
ARG SHS_IMAGE
ARG SPE_IMAGE

FROM ${SHS_IMAGE} as shs
FROM ${SPE_IMAGE} as spe
FROM ${PARENT_IMAGE}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Add headles module
COPY --from=shs C:\module\db C:\resources\jss

#powershell
COPY --from=spe C:\module\db C:\resources\spe