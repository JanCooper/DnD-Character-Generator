using System;
using DnD_Character_Generator.MongoRepository;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using Moq;
using NUnit.Framework;

namespace DnD_Character_Generator.Tests.DBContextTests
{
    public class DBContextTests
    {
        private Mock<IOptions<MongoSettings>> MOCK_OPTIONS;
        private Mock<IMongoDatabase> MOCK_DB;
        private Mock<IMongoClient> MOCK_CLIENT;
        private MongoSettings SETTINGS;


        public DBContextTests()
        {
            MOCK_OPTIONS = new Mock<IOptions<MongoSettings>>();
            MOCK_DB = new Mock<IMongoDatabase>();
            MOCK_CLIENT = new Mock<IMongoClient>();
        }

        [Test]
        public void DBContext_Constructor_IsInvokedSuccessfully()
        {
            // Arrange
            SETTINGS = new MongoSettings()
            {
                ConnectionString = "mongodb://test123",
                DatabaseName = "TestDB"
            };

            MOCK_OPTIONS.Setup(settings => settings.Value).Returns(SETTINGS);
            MOCK_CLIENT.Setup(client => client
            .GetDatabase(MOCK_OPTIONS.Object.Value.DatabaseName, null))
                .Returns(MOCK_DB.Object);

            // Act 
            DBContext actual = new DBContext(MOCK_OPTIONS.Object);

            // Assert 
            Assert.NotNull(actual);
        }

        [Test]
        public void DBContext_GetCollection_DoesNotAcceptEmptyCollectionName()
        {
            // Arrange
            SETTINGS = new MongoSettings()
            {
                ConnectionString = "mongodb://test123",
                DatabaseName = "TestDB"
            };

            MOCK_OPTIONS.Setup(settings => settings.Value).Returns(SETTINGS);
            MOCK_CLIENT.Setup(client => client
            .GetDatabase(MOCK_OPTIONS.Object.Value.DatabaseName, null))
                .Returns(MOCK_DB.Object);

            string expectedMessage = "Value cannot be empty. (Parameter 'name')";

            // Act
            DBContext context = new DBContext(MOCK_OPTIONS.Object);

            // Assert
            ArgumentException actual = Assert.Throws<ArgumentException>(
                () => context.GetCollection<TestModel>(""));

            Assert.That(actual.Message, Is.EqualTo(expectedMessage));
        }

        [Test]
        public void DBContext_GetCollection_ReturnsCollection()
        {
            // Arrange
            SETTINGS = new MongoSettings()
            {
                ConnectionString = "mongodb://test123",
                DatabaseName = "TestDB"
            };

            MOCK_OPTIONS.Setup(settings => settings.Value).Returns(SETTINGS);
            MOCK_CLIENT.Setup(client => client
            .GetDatabase(MOCK_OPTIONS.Object.Value.DatabaseName, null))
                .Returns(MOCK_DB.Object);

            // Act
            DBContext context = new DBContext(MOCK_OPTIONS.Object);
            IMongoCollection<TestModel> actual = context.GetCollection<TestModel>("TestModel");

            // Assert
            Assert.NotNull(actual);
        }
    }
}
