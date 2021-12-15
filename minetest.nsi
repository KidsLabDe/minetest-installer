!include "zipdll.nsh"


Unicode false


;--------------------------------
;General

  ;Name and file
  Name "Minetest Windows 64bit"

;Interface Configuration



# define name of installer
OutFile "installer.exe"
 
# define installation directory
InstallDir $DOCUMENTS\minetest
 
# For removing Start Menu shortcut in Windows 7
RequestExecutionLevel user

Page directory
Page instfiles



# start default section
Section
 
    # set the installation directory as the destination for the following actions
    SetOutPath $INSTDIR
 
    # create the uninstaller
    # WriteUninstaller "$INSTDIR\uninstall.exe"

    inetc::get /caption "Downloading Minetest" /canceltext "Cancel" "https://github.com/minetest/minetest/releases/download/5.4.1/minetest-5.4.1-win64.zip" "$INSTDIR\minetest-5.4.1-win64.zip" /end
    Pop $1 # return value = exit code, "OK" means OK

    !insertmacro ZIPDLL_EXTRACT "$INSTDIR\minetest-5.4.1-win64.zip" "$INSTDIR" "<ALL>"

    Rename "$INSTDIR\minetest-5.4.1-win64\bin" "$INSTDIR\bin"
    Rename "$INSTDIR\minetest-5.4.1-win64\builtin" "$INSTDIR\builtin"
    Rename "$INSTDIR\minetest-5.4.1-win64\client" "$INSTDIR\client"
    Rename "$INSTDIR\minetest-5.4.1-win64\clientmods" "$INSTDIR\clientmods"
    Rename "$INSTDIR\minetest-5.4.1-win64\doc" "$INSTDIR\doc"
    Rename "$INSTDIR\minetest-5.4.1-win64\fonts" "$INSTDIR\fonts"
    Rename "$INSTDIR\minetest-5.4.1-win64\games" "$INSTDIR\games"
    Rename "$INSTDIR\minetest-5.4.1-win64\locale" "$INSTDIR\locale"
    Rename "$INSTDIR\minetest-5.4.1-win64\mods" "$INSTDIR\mods"
    Rename "$INSTDIR\minetest-5.4.1-win64\textures" "$INSTDIR\textures"
    Rename "$INSTDIR\minetest-5.4.1-win64\minetest.conf.example" "$INSTDIR\minetest.conf.example"
    RMDir "$INSTDIR\minetest-5.4.1-win64" 
  #  File /r C:\Users\gw\Downloads\minetest-5.4.1-win64\*

    # create a shortcut named "new shortcut" in the start menu programs directory
    # point the new shortcut at the program uninstaller
    CreateShortcut "$SMPROGRAMS\Minetest.lnk" "$INSTDIR\bin\minetest.exe"
SectionEnd
 

; Pages

