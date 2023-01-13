# escape=`

ARG PARENT_IMAGE
ARG TOOLS_IMAGE
ARG SMS_IMAGE
ARG SOLUTION_IMAGE

FROM ${SOLUTION_IMAGE} as solution
FROM ${TOOLS_IMAGE} as tools
FROM ${SMS_IMAGE} as sms
FROM ${PARENT_IMAGE}

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR C:\inetpub\wwwroot

#Add SMS module
COPY --from=sms C:\module\cm\content C:\inetpub\wwwroot

# Copy developer tools and entrypoint
COPY --from=tools C:\tools C:\tools

# Copy solution website files
COPY --from=solution \artifacts\website\ .\
