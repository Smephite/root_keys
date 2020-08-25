@echo off
echo Make sure the Yubi Key is plugged in!
PAUSE
echo Enter your gpg.exe location [c:\Program Files (x86)\GnuPG\bin\gpg.exe]
SET /P "gpg=" || SET "gpg=c:\Program Files (x86)\GnuPG\bin\gpg.exe"


git config --global user.signingkey 017F0C59
git config --global gpg.program "%gpg%"
echo In the next step type 'fetch' ENTER 'quit' ENTER
pause
"%gpg%" --edit-card
"%gpg%" --list-secret-keys
echo If there is an entry 'sec#  rsa4096 2019-12-26 [C]  D1ADA8D7D88AABC5129C4D2998A58406017F0C59' you are done
echo (notice the #)
pause