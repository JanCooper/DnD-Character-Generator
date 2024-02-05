using AngleSharp.Dom;
using AngleSharp.Html.Dom;
using AngleSharp.Html.Parser;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Permissions;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace CharacterCreatorApp
{
    public sealed class Data_Web
	{
        internal const string baseURL = "https://www.dndbeyond.com/";

        // https://docs.microsoft.com/en-us/archive/msdn-magazine/2015/july/async-programming-brownfield-async-development

        public string Get(string keyword)
        {
            using (WebClient client = new WebClient())
                return client.DownloadString(baseURL + keyword);
        }
        

 
    }
}
