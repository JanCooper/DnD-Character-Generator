using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace DnD_Character_Generator.MongoService
{
    public class DBContext
    {
        private IMongoDatabase _database { get; set; }
        private MongoClient _client { get; set; }
        private MongoSettings _settings { get; set; }

        public DBContext(IOptions<MongoSettings> settings)
        {
            _settings = settings.Value;
            _client = new MongoClient(_settings.ConnectionString);
            _database = _client.GetDatabase(_settings.DatabaseName);
        }

        public IClientSessionHandle Session { get; set; }


        public IMongoCollection<T> GetCollection<T>(string name)
        {
            return _database.GetCollection<T>(name);
        }
    }
}
