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
            Sitecore.Diagnostics.Log.Info(JValue.Parse(body).ToString(Formatting.Indented),this);

        }
        catch (Exception ex)
        {   
            Sitecore.Diagnostics.Log.Error("webhooksitecorelog fail", ex, this);
            
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