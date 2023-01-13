using Sitecore.Data.Items;
using Sitecore.Events;
using Sitecore.Extensions;
using Sitecore.Webhook.Helpers.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Sitecore.Webhook.Helpers.Event
{
    public class RaiseCustomIndexing
    {
        public void AddIndexName(object sender, EventArgs args)
        {
            if (args != null)
            {

                SitecoreEventArgs sitecoreEventArgs = args as SitecoreEventArgs;
                if (sitecoreEventArgs != null && sitecoreEventArgs.Parameters != null && sitecoreEventArgs.Parameters.Length > 0)
                {
                    Item eventItem = Context.ContentDatabase.GetItem("/sitecore/system/Settings/Webhooks/Rule Items/" + sitecoreEventArgs.Parameters[0]);

                    if (sitecoreEventArgs.Parameters != null && eventItem != null)
                    {

                        IList<object> parameters = new List<object>();
                        parameters.Add(eventItem);
                       

                        var teamsMessage = new text();
                        teamsMessage.textmessage = "Hello from RaiseCustomIndexing "+ sitecoreEventArgs.Parameters[0].ToString();
                        parameters.Add(teamsMessage);

                        parameters.AddRange(sitecoreEventArgs.Parameters);
                        object[] objArray = parameters.Cast<object>().ToArray();
                        Sitecore.Events.Event.RaiseEvent("customindexing:end", objArray);

                    }

                }
            }
        }
    }
}