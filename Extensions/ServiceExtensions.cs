using DnD_Character_Generator.Contracts;
using LoggerService;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

namespace DnD_Character_Generator.Extensions
{
    public static class ServiceExtensions
    {
        public static void ConfigureCors(this IServiceCollection services)
        { // basic settings to add CORS (Cross-Origin Resource Sharing: because Vue.js client is on a different domain)
            services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", 
                    builder => builder.AllowAnyOrigin() // WithOrigins("http://www.something.com") to restrict
                    .AllowAnyMethod()                   // WithMethods("POST", "GET") to restrict
                    .AllowAnyHeader());                 // WithHeaders("accept", "content-type") to resstrict
            });
        }

        public static void ConfigureIISIntegration(this IServiceCollection services)
        { // Internet Information Server == the server hosting the website
            services.Configure<IISOptions>(options =>
            {                                           // default values are fine                                 
            });
        }

        public static void ConfigureLoggerService(this IServiceCollection services)
        {
            services.AddSingleton<ILoggerManager, LoggerManager>();
        }
    }
}
