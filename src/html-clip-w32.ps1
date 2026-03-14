# Reads HTML from a file, wraps in CF_HTML format, sets clipboard
# Sets both CF_HTML and CF_UNICODETEXT so apps like Slack work
param([string]$InputFile)

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;

public class Win32Clipboard {
    [DllImport("user32.dll")]
    public static extern bool OpenClipboard(IntPtr hWndNewOwner);
    [DllImport("user32.dll")]
    public static extern bool CloseClipboard();
    [DllImport("user32.dll")]
    public static extern bool EmptyClipboard();
    [DllImport("user32.dll")]
    public static extern IntPtr SetClipboardData(uint uFormat, IntPtr hMem);
    [DllImport("user32.dll")]
    public static extern uint RegisterClipboardFormat(string lpszFormat);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GlobalAlloc(uint uFlags, UIntPtr dwBytes);
    [DllImport("kernel32.dll")]
    public static extern IntPtr GlobalLock(IntPtr hMem);
    [DllImport("kernel32.dll")]
    public static extern bool GlobalUnlock(IntPtr hMem);

    const uint CF_UNICODETEXT = 13;

    static IntPtr AllocBytes(byte[] data) {
        IntPtr hMem = GlobalAlloc(0x0042, (UIntPtr)data.Length);
        IntPtr pMem = GlobalLock(hMem);
        Marshal.Copy(data, 0, pMem, data.Length);
        GlobalUnlock(hMem);
        return hMem;
    }

    public static bool SetHtmlAndText(string cfHtmlData, string plainText) {
        uint cfHtml = RegisterClipboardFormat("HTML Format");
        IntPtr hHtml = AllocBytes(Encoding.UTF8.GetBytes(cfHtmlData + "\0"));
        IntPtr hText = AllocBytes(Encoding.Unicode.GetBytes(plainText + "\0"));

        for (int i = 0; i < 10; i++) {
            if (OpenClipboard(IntPtr.Zero)) {
                EmptyClipboard();
                SetClipboardData(cfHtml, hHtml);
                SetClipboardData(CF_UNICODETEXT, hText);
                CloseClipboard();
                return true;
            }
            System.Threading.Thread.Sleep(100);
        }
        return false;
    }

    public static string StripHtml(string html) {
        string text = Regex.Replace(html, "<[^>]+>", "");
        text = System.Net.WebUtility.HtmlDecode(text);
        return text.Trim();
    }
}
"@

$html = [System.IO.File]::ReadAllText($InputFile, [System.Text.Encoding]::UTF8)
Remove-Item $InputFile -Force -ErrorAction SilentlyContinue

# Build CF_HTML format
$pre = "<html><body><!--StartFragment-->"
$post = "<!--EndFragment--></body></html>"
$headerTmpl = "Version:0.9`r`nStartHTML:{0:D10}`r`nEndHTML:{1:D10}`r`nStartFragment:{2:D10}`r`nEndFragment:{3:D10}`r`n"
$dummyHeader = $headerTmpl -f 0,0,0,0
$headerLen = [System.Text.Encoding]::UTF8.GetByteCount($dummyHeader)
$startFragment = $headerLen + [System.Text.Encoding]::UTF8.GetByteCount($pre)
$endFragment = $startFragment + [System.Text.Encoding]::UTF8.GetByteCount($html)
$endHtml = $endFragment + [System.Text.Encoding]::UTF8.GetByteCount($post)

$cfHtml = ($headerTmpl -f $headerLen, $endHtml, $startFragment, $endFragment) + $pre + $html + $post
$plainText = [Win32Clipboard]::StripHtml($html)

[Win32Clipboard]::SetHtmlAndText($cfHtml, $plainText)
