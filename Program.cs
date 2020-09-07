using System;
using System.Diagnostics;
using System.IO;
using System.Text;

namespace DiscordIntegrityChecker
{
    class Program
    {
        static void Main(string[] args)
        {
            bool virus = false;
            string discordVersion = String.Empty;

            Console.Title = "Discord Integrity Checker";
            Console.WriteLine("[NAMELESSGOD] - Discord Integrity Checker");
            Console.WriteLine("Scanning Discord files....");

            string[] pathdir = Directory.GetDirectories(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\discord", "0.0.*", SearchOption.AllDirectories);
            foreach(string p in pathdir)
            {
                DirectoryInfo di = new DirectoryInfo(p);
                discordVersion = di.Name;
            }
            if(discordVersion == String.Empty)
            {
                Console.WriteLine("Coudn't find the discord version, exiting");
                Console.ReadLine();
                Environment.Exit(0);
            }


            var processes = Process.GetProcesses();
            foreach (var p in processes)
            {
                if (p.ProcessName == "Discord")
                {
                    p.Kill(true);
                    Console.WriteLine("Killed Discord process");
                }
            }

            string[] allfiles = Directory.GetFiles(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\discord\" + discordVersion + @"\modules", "*.js", SearchOption.AllDirectories);
            foreach (var f in allfiles)
            {
                FileInfo info = new FileInfo(f);
                string[] arrLine = File.ReadAllLines(info.FullName);
                for(var i = 0; i < arrLine.Length; i++)
                {
                    if (arrLine[i].ToLower().Contains("webhook"))
                    {
                        Console.WriteLine("Infected file detected (" + info.Name + "), code : ");
                        Console.WriteLine(arrLine[i]);
                        arrLine[i] = String.Empty;
                        virus = true;
                    }
                }
                File.WriteAllLines(info.FullName, arrLine);
            }
            if (!virus)
            {
                var process = new Process
                {
                    StartInfo = new ProcessStartInfo
                    {
                        FileName = Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData) + @"\Discord\app-" + discordVersion + @"\Discord.exe",
                        Arguments = "",
                        UseShellExecute = false,
                        RedirectStandardOutput = false,
                        CreateNoWindow = false,
                    }
                };
                process.Start();
                Environment.Exit(0);
            }
            else
            {
                Console.WriteLine("Since a Virus got detected, run the program again to start discord.");
                Console.WriteLine("To exit, press Enter.");
                Console.ReadLine();
                Environment.Exit(0);
            }
        }
    }
}
