using System.Threading.Tasks;
using DSharpPlus;
using DSharpPlus.CommandsNext;
using DSharpPlus.CommandsNext.Attributes;
    
namespace ATBot
{
    public class BasicCommands
    {
        [Command("version")]
        public async Task Version(CommandContext ctx)
        {
            await ctx.RespondAsync("The current version is: " + GetType().Assembly.GetName().Version.ToString());
        }
    }
}