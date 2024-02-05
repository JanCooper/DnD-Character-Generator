using DnD_Character_Generator.Contracts;
using Moq;
using NUnit.Framework;

namespace DnD_Character_Generator.Tests
{
    public class LoggerServiceTests
    {
        private Mock<ILoggerManager> LOGGER;
        private LoggerServiceTests_TestClass TEST_OBJECT;

        [SetUp]
        public void Setup()
        {
        }

        [Test]
        public void LoggerService_LogInfo_LogsInfoLevelMessages()
        {
            // arrange
            LOGGER = new Mock<ILoggerManager>();
            LOGGER.Setup(mock => mock.LogInfo("Logging Info"));
            TEST_OBJECT = new LoggerServiceTests_TestClass(LOGGER.Object);

            // act
            TEST_OBJECT.LogInfo();

            // assert
            LOGGER.VerifyAll();
        }

        [Test]
        public void LoggerService_LogDebug_LogsDebugMessages()
        {
            // arrange
            LOGGER = new Mock<ILoggerManager>();
            LOGGER.Setup(mock => mock.LogDebug("Logging Debug"));
            TEST_OBJECT = new LoggerServiceTests_TestClass(LOGGER.Object);

            // act
            TEST_OBJECT.LogDebug();

            // assert
            LOGGER.VerifyAll();
        }

        [Test]
        public void LoggerService_LogError_LogsErrorMessages()
        {
            // arrange
            LOGGER = new Mock<ILoggerManager>();
            LOGGER.Setup(mock => mock.LogError("Logging Error"));
            TEST_OBJECT = new LoggerServiceTests_TestClass(LOGGER.Object);

            // act
            TEST_OBJECT.LogError();

            // assert
            LOGGER.VerifyAll();
        }

        [Test]
        public void LoggerService_LogWarn_LogsWarnings()
        {
            // arrange
            LOGGER = new Mock<ILoggerManager>();
            LOGGER.Setup(mock => mock.LogWarn("Logging Warn"));
            TEST_OBJECT = new LoggerServiceTests_TestClass(LOGGER.Object);

            // act
            TEST_OBJECT.LogWarn();

            // assert
            LOGGER.VerifyAll();
        }
    }
}