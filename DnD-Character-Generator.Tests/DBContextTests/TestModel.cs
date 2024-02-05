using MongoDB.Bson.Serialization.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace DnD_Character_Generator.Tests.DBContextTests
{
    class TestModel
    {
        [BsonId]
        public Guid SpellId { get; set; }
        [BsonElement("Name")]
        public string SpellName { get; set; }

    }
}
