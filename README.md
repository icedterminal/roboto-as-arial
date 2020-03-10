# Roboto as Arial

I loathe Arial with an unbridled passion. I can not even begin to describe my [reprehensible disgust](https://www.google.com/search?q=arial+is+bad) for this forgery of a font.

Replace it with Roboto.

## Undo, Revert, Restore

Before you attempt this, create a restore point. Though nothing has happened to me on any of my VMs or the host system, you never know. Plus if you want the original Arial back, restore is easy. Even if you don't, the script tries to create one for you and makes a backup copy of the original ArialMT fonts and copies them to your documents folder. If you cannot restore, you can put all of the files back in their original place manually.

You can reset permissions with PowerShell.
```
> icacls $env:WINDIR\Fonts\ari*.ttf /q /c /reset
> icacls $env:WINDIR\WinSxS\amd64_microsoft-windows-font-truetype-arial* /t /q /c /reset
> icacls $env:WINDIR\WinSxS\amd64_microsoft-windows-f..truetype-arialblack* /t /q /c /reset
> icacls $env:WINDIR\WinSxS\Manifests\amd64_microsoft-windows-font-truetype-arial*.manifest /q /c /reset
> icacls $env:WINDIR\WinSxS\Manifests\amd64_microsoft-windows-f..truetype-arialblack*.manifest /q /c /reset
> sfc /sannow
```

## How To

There are two ways: Run a script, or do it all manually. If you want to use the script, follow the directions below:

1. Open PowerShell as admin (Win + X, A)
2. Type or copy/paste in: `set-executionpolicy unrestricted`
    - If you don't do this, you can't run the script which makes this job ten times easier.
3. Clone/Download/Save this repo.
4. Extract the contents to your desktop. Example:

![desktop](https://i.imgur.com/efgsOKH.png)

5. Run the script.
6. When the script completes, reboot.
    - If you encounter any errors please open an issue.
7. Optional: You can restore or revert the policy of PowerShell scripts with `set-executionpolicy restricted`

If you want to do it all yourself, have at it.

## Well... shucks

Updates have a chance to undo all of this. If you notice it, repeat the process to replace. OS upgrades (eg: 1809 to 1903) will restore good 'ol ugly Arial.

## Notes

I purposefully made the script explicit. I could have condensed it down as others would call it "more efficient", but elected not to. I realise some people might not fully understand what the script does. And laying it all out makes it slightly more understandable. So you see every action it makes as you read over it. Feel free to scrutinise it if you have any doubts.

The PowerShell script removes the fonts themselves, registry links, the Arial SxS directory and the manifest. Then copies the replacements fonts and links them with the registry. For those of you that do not know what the SxS store is, Windows will restore the original Arial fonts during a system clean up through the use of DISM. This defeats the purpose of replacing the fonts. So it has to go. Don't fret about future use, because DISM will pass a clean up if the files aren't counted. Because they're not there! Leaving the SxS sources there has some implications later down the line if you do have system errors that are entirely unrelated.

While the script runs, when it gets to the SxS portion it will appear to hang. In reality it does not. It is searching the SxS directory for the associated Arial backups. Due to the unique nature of SxS, they are not always named the same. As such the script uses a wildcard approach. The directories take the build version of the OS in name. If I had used to the exact naming scheme from the test VMs, it would only target a specific verison of 1909.

I tested this script multiple times over with different versions of Windows 10 in VMs and had no issues. While there should be no complications using Roboto, there is an off chance something may not render correctly. Which is why I mention to make a restore point prior. In addition to the script copying the originals and making sure the Roboto font files have permissions that allow you to remove them.

If you're wondering how this was/is possible, [allow me to break it down for you](https://getyarn.io/yarn-clip/75e5f36f-f484-4cc7-bc8d-d59c1cc0a4bb). I downloaded [Roboto v2](https://fonts.google.com/specimen/Roboto). Opened only the fonts I needed to replace Arial with in [FontCreator](https://www.high-logic.com/font-editor/fontcreator). Changed just the naming scheme while leaving everything else intact. Export. Done. You can't just rename the font files from `Roboto.ttf` to `arial.ttf`. It doesn't work like that. You have to edit the font data naming scheme.

# ReAlLY important bits

If you use the script, do keep in mind you are using at your own risk.

__Disclaimer of Warranty__

Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.

__Limitation of Liability__

In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.

---

Roboto by Christian Robertson is licensed under the Apache License 2.0.

To keep with consistency, the rest of this projects files are also licensed under the Apache License 2.0.
