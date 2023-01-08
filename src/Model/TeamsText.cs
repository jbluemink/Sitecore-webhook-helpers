using Newtonsoft.Json;
using Sitecore.Webhook.Helpers.Converter;


namespace Sitecore.Webhook.Helpers.Model
{
    [JsonConverter(typeof(ToStringJsonConverter))]
    public class text
    {
        public string textmessage;

        public override string ToString()
        {
            return textmessage;
        }
    }
}