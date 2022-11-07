Make sure you have the most current version of Visual Studio Code. If you install via a company portal, you might not have the most current version.

On machine A

Unix:

`code --list-extensions | xargs -L 1 echo code --install-extension`

Windows (PowerShell, e. g. using Visual Studio Code's integrated Terminal):

`code --list-extensions | % { "code --install-extension $_" }`


`code --install-extension Angular.ng-template`
`code --install-extension DSKWRK.vscode-generate-getter-setter`
`code --install-extension EditorConfig.EditorConfig`
`code --install-extension HookyQR.beautify`

Please make sure you have the code command line installed. For more information, please visit 
https://code.visualstudio.com/docs/editor/command-line