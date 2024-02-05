db = connect("localhost:27020/CharacterGenerator");

db.createUser(
{
   user: "userCharacterGenerator",
   pwd: "ChAraCTerGenerATorPwd123",
   roles: [{ role: "readWrite", db: "CharacterGenerator" }]
}
)


var credential =MongoCredential.CreateCredential(databaseName: CharacterGenerator, username: userCharacterGenerator, password: ChAraCTerGenerATorPwd123);
 
var settings = new MongoClientSettings
{
    Credential = credential
};
 
var mongoClient = new MongoClient(settings);