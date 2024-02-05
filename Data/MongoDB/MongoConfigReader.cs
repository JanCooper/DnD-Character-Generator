using DnD_Character_Generator.Contracts;
using Microsoft.Extensions.Options;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace DnD_Character_Generator.MongoService
{
    class MongoConfigReader : IMongoConfigReader
    {
        private readonly MongoSettings _settings;
        public MongoConfigReader (IOptionsSnapshot<MongoSettings> options)
        {
            _settings = options.Value;
        }

        public string ReadMongoSettings()
        {
            return JsonConvert.SerializeObject(_settings);
        }
    }
}
