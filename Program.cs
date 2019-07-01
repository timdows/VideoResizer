using System;
using System.IO;

namespace VideoResizer
{
    class Program
    {
        static void Main(string[] args)
        {
            var files = Directory.GetFiles(@"C:\Users\Timdows\Desktop\2019 vidoes resized");
            foreach (var file in files)
            {
                var fileName = Path.GetFileName(file).Replace("VID_", string.Empty).Replace(".mp4", string.Empty);
                var date = DateTime.ParseExact(fileName, "yyyyMMdd_HHmmss", null);

                Console.WriteLine($"{file} {date}");

                File.SetLastWriteTime(file, date);
            }
        }
    }
}
