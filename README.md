# Sitecore-webhook-helpers
Demo code to create events with data as desired usable for Sitecore Webhooks.
With Docker setup for Sitecore 10.3 XM. Code is for XM Cloud or Sitecore 10.3+

Webhook handlers you can local use for testing:

- webhooklog.ashx
Write JSON or XML data to file inside the Sitecore log folder

- webhooksitecorelog.ashx
Write JSON data to Sitecore.Diagnostics.Log.Info 

- webhooksitecorelogvalidation.ashx
Write JSON data to Sitecore.Diagnostics.Log.Info. return {"IsValid":true,"Message":""} usablr for Workflow Webhook validation action