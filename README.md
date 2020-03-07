# Roboto as Arial

I loathe Arial with an unbridled passion. I can not even begin to describe my [reprehensible disgust](https://www.google.com/search?q=arial+is+bad) for this forgery of a font.

Replace it with Roboto.

## Undo, Revert, Restore

Before you attempt this, create a restore point. Though nothing has happened to me on any of my VMs or the host system, you never know. Plus if you want the original Arial back, restore is easy. Even if you don't, the script makes a backup copy of the original ArialMT fonts and copies them to your documents folder.

## How To

There are two ways: Run a script, or do it all manually.

The PowerShell script removes the fonts themselves, registry links, the Arial SxS directory and the manifest. If you don't remove the manifest and the SxS store, then Windows will restore the original Arial fonts during a system clean up. Don't fret, because DISM will pass a clean up if the files aren't counted. Because they're not there!

If you want to use the script, follow the directions below:

1. Open PowerShell as admin (Win + X, A)
2. Type or copy/paste in: `set-executionpolicy unrestricted`
    - If you don't do this, you can't run the script which makes this job ten times easier.
3. Clone/Download/Save this repo.
4. Extract the contents to your desktop.

![desktop](https://i.imgur.com/efgsOKH.png)

5. Run the script. Type or copy/paste in: `$env:USERPROFILE\Desktop\roboto-as-arial.ps1`
6. When the script completes, reboot.
    - If you encounter any errors please open an issue.
7. Optional: You can restore or revert the policy of PowerShell scripts with `set-executionpolicy restricted`

## Well... shucks

Updates have a chance to undo all of this. If you notice it, repeat the how-to. OS upgrades (eg: 1809 to 1903) will restore good 'ol ugly Arial.

## Notes

I purposefully made the script explicit. One by one. I could have condensed it down as others would call it "more efficient", but elected not to. I realise some people might not fully understand what the script does. And laying it all out makes it more understandable. So you see every action it makes as you read over it. Feel free to scrutinise it if you have any doubts.

I tested this script multiple times over with different versions of Windows 10 in VM.

# Legal stuff

If you use the script, do keep in mind you are using at your own risk.

__Disclaimer of Warranty__

Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.

__Limitation of Liability__

In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.

---

Roboto by Christian Robertson is licensed under the Apache License 2.0.

To keep with consistency, the rest of this projects files are also licensed under the Apache License 2.0.

