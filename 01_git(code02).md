# Git 다루기

#### 다른 컴퓨터에서 프로젝트 같이 이용하기

```shell
A@DESKTOP-BDHGJBV MINGW64 ~
$ mkdir campus  #다른 컴퓨터의 campus 파일

A@DESKTOP-BDHGJBV MINGW64 ~
$ ls
'3D Objects'/
 anaconda3/
 AppData/
'Application Data'@
 campus/
 Contacts/
 Cookies@
 Desktop/
 Documents/
 Downloads/
 Favorites/
 IntelGraphicsProfiles/
 Links/
'Local Settings'@
 MicrosoftEdgeBackups/
 Music/
'My Documents'@
 NetHood@
 NTUSER.DAT
 ntuser.dat.LOG1
 ntuser.dat.LOG2
 NTUSER.DAT{13f6df88-c07a-11e9-8367-000c2946b77d}.TM.blf
 NTUSER.DAT{13f6df88-c07a-11e9-8367-000c2946b77d}.TMContainer00000000000000000001.regtrans-ms
 NTUSER.DAT{13f6df88-c07a-11e9-8367-000c2946b77d}.TMContainer00000000000000000002.regtrans-ms
 ntuser.ini
 ntuser.pol
 OneDrive/
 Oracle/
 Pictures/
 PrintHood@
 Recent@
'Saved Games'/
 Searches/
 SendTo@
 Templates@
 TIL/
 Untitled.ipynb
 Videos/
'시작 메뉴'@

A@DESKTOP-BDHGJBV MINGW64 ~
$ cd campus

A@DESKTOP-BDHGJBV MINGW64 ~/campus
$ git clone https://github.com/OfficialSeonyeong/TIL.git
Cloning into 'TIL'...
remote: Enumerating objects: 17, done.
remote: Counting objects: 100% (17/17), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 17 (delta 3), reused 15 (delta 1), pack-reused 0
Unpacking objects: 100% (17/17), 8.17 KiB | 72.00 KiB/s, done.

A@DESKTOP-BDHGJBV MINGW64 ~/campus
$ ls
TIL/

A@DESKTOP-BDHGJBV MINGW64 ~/campus
$ cd TIL

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ ls -a
./  ../  .git/  00_markdown.md  01_git.md  README.md  TIL_Git.md

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ touch django.md

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        django.md

nothing added to commit but untracked files present (use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git add django.md

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git commit -m "Add django.md"
[master 643f1bd] Add django.md
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 django.md

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git log --oneline
643f1bd (HEAD -> master) Add django.md
ef35c56 (origin/master, origin/HEAD) ADD README.md
426027a Add README.md
600eb3c rename file
7b1ce1e Document from class
568b5cb more study
f2e3348 First commit

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git remote
origin

A@DESKTOP-BDHGJBV MINGW64 ~/campus/TIL (master)
$ git push origin master
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 287 bytes | 47.00 KiB/s, done.
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
remote: Resolving deltas: 100% (1/1), completed with 1 local object.
To https://github.com/OfficialSeonyeong/TIL.git
   ef35c56..643f1bd  master -> master

```

