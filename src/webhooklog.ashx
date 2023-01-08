<%@ WebHandler Language="C#" Debug="true" Class="TestWebhookHandler" %>

using System;
using System.Web;
using System.IO;
using Sitecore;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

public class TestWebhookHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";

        string body = String.Empty;
        context.Request.InputStream.Position = 0;

        try
        {
	    string dataFolder = Sitecore.IO.FileUtil.MapPath(Sitecore.Configuration.Settings.DataFolder);
            using (var inputStream = new StreamReader(context.Request.InputStream))
            {
                body = inputStream.ReadToEnd();
            }

	    File.WriteAllText(dataFolder+ "\\logs\\Webhook" + DateTime.Now.Ticks + ".txt", JValue.Parse(body).ToString(Formatting.Indented));
        }
        catch (Exception ex)
        {   
            Sitecore.Diagnostics.Log.Error("webhooklog fail", ex, this);
            
        }
        finally
        {
           context.Response.End();
        }

    }

    public bool IsReusable
    {
        get
        {
            return true;
        }
    }   


}