using DnD_Character_Generator.Contracts;

public class LoggerServiceTests_TestClass
{
    private readonly ILoggerManager _logger;
    public LoggerServiceTests_TestClass(ILoggerManager logger)
    {
        _logger = logger;
    }

    public void LogDebug()
    {
        _logger.LogDebug("Logging Debug");
    }

    public void LogError()
    {
        _logger.LogError("Logging Error");
    }

    public void LogInfo()
    {
        _logger.LogInfo("Logging Info");
    }

    public void LogWarn()
    {
        _logger.LogWarn("Logging Warn");
    }
}