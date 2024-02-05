using DnD_Character_Generator.Contracts;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace DnD_Character_Generator.MongoService
{
    public abstract class BaseRepository<TEntity> : IMongoBaseRepository<TEntity>
    {
        protected readonly IMongoDBContext _mongoContext;
        protected IMongoCollection<TEntity> _collection;

        protected BaseRepository(IMongoDBContext context)
        {
            _mongoContext = context;
            _collection = _mongoContext.GetCollection<TEntity>(typeof(TEntity).Name);
        }

        public async Task<TEntity> GetById(string id)
        {
            ObjectId objectId = new ObjectId(id);
            FilterDefinition<TEntity> filter = Builders<TEntity>.Filter.Eq("_id", objectId);
            return await _collection.FindAsync(filter).Result.FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<TEntity>> GetAll()
        {
            var all = await _collection.FindAsync(Builders<TEntity>.Filter.Empty);
            return await all.ToListAsync();
        }

        public async Task Create(TEntity entityObject)
        {
            if (entityObject == null)
            {
                throw new ArgumentNullException(typeof(TEntity).Name + " object is null");
            }
            await _collection.InsertOneAsync(entityObject);
        }

        public virtual void Update(TEntity entityObject, string objectId)
        {
            _collection.ReplaceOneAsync(Builders<TEntity>.Filter.Eq("_id", objectId), entityObject);
        }

        public void Delete(string id)
        {
            var objectId = new ObjectId(id);
            _collection.DeleteOneAsync(Builders<TEntity>.Filter.Eq("_id", objectId));

        }
    }
}
