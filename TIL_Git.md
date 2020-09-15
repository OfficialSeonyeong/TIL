# Git 다루기

```shell
A@DESKTOP-BDHGJBV MINGW64 ~
$ pwd
/c/Users/A  # 홈디렉토리 위치

A@DESKTOP-BDHGJBV MINGW64 ~
$ ls         # 폴더에 있는 파일 리스트
'3D Objects'/
 anaconda3/
 AppData/
'Application Data'@
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
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.0.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.1.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.2.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.blf
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
 Untitled.ipynb
 Videos/
'시작 메뉴'@

A@DESKTOP-BDHGJBV MINGW64 ~
$ cd Downloads/ # 다운로드 폴더로 이동


A@DESKTOP-BDHGJBV MINGW64 ~/Downloads
$ cd .. # 홈디렉토리로 돌아가기

A@DESKTOP-BDHGJBV MINGW64 ~
$ mkdir git # 폴더 생성

A@DESKTOP-BDHGJBV MINGW64 ~
$ ls
'3D Objects'/
 anaconda3/
 AppData/
'Application Data'@
 Contacts/
 Cookies@
 Desktop/
 Documents/
 Downloads/
 Favorites/
 git/   # 생성 완료 확인
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
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.0.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.1.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.2.regtrans-ms
 NTUSER.DAT{13f6df87-c07a-11e9-8367-000c2946b77d}.TxR.blf
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
 Untitled.ipynb
 Videos/
'시작 메뉴'@

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ cd .. #홈디렉토리로 이동

A@DESKTOP-BDHGJBV MINGW64 ~
$ rm -r git/ #git 폴더 삭제

A@DESKTOP-BDHGJBV MINGW64 ~
$ mkdir git # git 폴더 생성

A@DESKTOP-BDHGJBV MINGW64 ~
$ cd git 

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ touch a.txt # a 텍스트 파일 생성

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls
a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ cp a.txt . # 복사, 같은 폴더에 같은 이름의 파일 복사 불가
cp: 'a.txt' and './a.txt' are the same file

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ cp a.txt ./b.txt # b 텍스트 파일로 이름 변경하여 복사

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls
a.txt  b.txt

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ rm a.txt b.txt # 두 개의 파일 삭제

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ mkdir a #a 폴더 생성

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls
a/

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ cp -r a ./b

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls
a/  b/

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ touch a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls # a 폴더, a 텍스트 파일, b 폴더 존재
a/  a.txt  b/

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ rm -r a/ b/ # a,b 폴더 삭제

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ touch a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ mv a.txt b.txt # 파일 이름 수정(a -> b)

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ ls
b.txt

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ git --version #git 설치 유무 확인
git version 2.28.0.windows.1

A@DESKTOP-BDHGJBV MINGW64 ~/git
$ cd ~

A@DESKTOP-BDHGJBV MINGW64 ~
$ pwd
/c/Users/A

A@DESKTOP-BDHGJBV MINGW64 ~
$ mkdir basic_git # basic_git 폴더 생성

A@DESKTOP-BDHGJBV MINGW64 ~
$ cd basic_git # basic_git 폴더로 이동

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git
$ git init # git 작동
Initialized empty Git repository in C:/Users/A/basic_git/.git/

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ ls

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ ls -a # 숨김 파일까지 나열
./  ../  .git/

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ rm -rf .git # 파일 삭제(git 종료)

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git
$ ls

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git
$ ls -a  # 파일 삭제 확인
./  ../

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git
$ git init # git 작동
Initialized empty Git repository in C:/Users/A/basic_git/.git/

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status # 상태 확인
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ ls

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ touch a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ ls
a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        a.txt

nothing added to commit but untracked files present (use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git add a.txt # 스냅샷을 위한 Staging

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   a.txt  #초록색으로 표시되어 커밋 준비 완료 의미


A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git commit # 스냅샷 저장

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got 'A@DESKTOP-BDHGJBV.(none)')
A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$   git config --global user.name "윤선영"

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git config --global user.email "sunday.myday2@gmail.com"

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git commit -m "first commit" #커밋 메세지
[master (root-commit) 2eb2bf8] first commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git log # 버전 하나 생성
commit 2eb2bf8fa9ad03898b830ae2de543c5226f832dd (HEAD -> master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 14:55:28 2020 +0900

    first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ ls
a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status
On branch master
nothing to commit, working tree clean

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status # a.txt 수정 후 상태 확인
On branch master
Changes not staged for commit: #커밋 준비 전
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt # 수정을 인지

no changes added to commit (use "git add" and/or "git commit -a")

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git add a.txt

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status
On branch master
Changes to be committed: #커밋 준비 완료
  (use "git restore --staged <file>..." to unstage)
        modified:   a.txt


A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git commit -m "Modify a.txt"
[master 62eb397] Modify a.txt
 1 file changed, 1 insertion(+)

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git log # 버전 두 개 생성
commit 62eb3972f0cb0246cc767cfc7c78e046325e53c0 (HEAD -> master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 15:15:03 2020 +0900

    Modify a.txt

commit 2eb2bf8fa9ad03898b830ae2de543c5226f832dd
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 14:55:28 2020 +0900

    first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git status # 한번 더 파일 수정 후 상태 확인
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
        modified:   a.txt

no changes added to commit (use "git add" and/or "git commit -a")

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git add a.txt  #Staging

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git commit -m "Add world to a.txt"
[master e98d95e] Add world to a.txt
 1 file changed, 2 insertions(+), 1 deletion(-)

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git log #세 개의 버전 생성
commit e98d95e09e9611958f86359f0af3eaa6ea9408c2 (HEAD -> master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 15:17:29 2020 +0900

    Add world to a.txt

commit 62eb3972f0cb0246cc767cfc7c78e046325e53c0
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 15:15:03 2020 +0900

    Modify a.txt

commit 2eb2bf8fa9ad03898b830ae2de543c5226f832dd
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 14:55:28 2020 +0900

    first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git log --oneline # 간편한 버전 확인법
e98d95e (HEAD -> master) Add world to a.txt
62eb397 Modify a.txt
2eb2bf8 first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ git checkout 2eb2bf8  #과거 버전으로 회귀
Note: switching to '2eb2bf8'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -c with the switch command. Example:

  git switch -c <new-branch-name>

Or undo this operation with:

  git switch -

Turn off this advice by setting config variable advice.detachedHead to false

HEAD is now at 2eb2bf8 first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git ((2eb2bf8...))
$ git log #첫 번째 버전으로 회귀했기 때문에 하나의 버전만 생성
commit 2eb2bf8fa9ad03898b830ae2de543c5226f832dd (HEAD)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 14:55:28 2020 +0900

    first commit

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git ((2eb2bf8...))
$ git checkout master # 현실로 복귀
Previous HEAD position was 2eb2bf8 first commit
Switched to branch 'master'

A@DESKTOP-BDHGJBV MINGW64 ~/basic_git (master)
$ cd .. # 홈디렉토리로 이동

A@DESKTOP-BDHGJBV MINGW64 ~
$ mkdir TIL

A@DESKTOP-BDHGJBV MINGW64 ~
$ cd TIL/

A@DESKTOP-BDHGJBV MINGW64 ~/TIL
$ ls

A@DESKTOP-BDHGJBV MINGW64 ~/TIL
$ git init # git 실행
Initialized empty Git repository in C:/Users/A/TIL/.git/

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ ls -a #숨김 파일 나열(git 실행 여부 확인)
./  ../  .git/

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ ls
윤선영.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        "\354\234\244\354\204\240\354\230\201.md" #한글 이름 사용 시

nothing added to commit but untracked files present (use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
        00_markdown.md.md

nothing added to commit but untracked files present (use "git add" to track)

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ ls #파일 이름 수정 후
00_markdown.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git add 00_markdown.md #Staging

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
        new file:   00_markdown.md


A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git commit -m "First commit"
[master (root-commit) f2e3348] First commit
 1 file changed, 174 insertions(+)
 create mode 100644 00_markdown.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git log
commit f2e33481a50fe347b699198595cb8d5a3e100c05 (HEAD -> master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 15:46:26 2020 +0900

    First commit
    
# 외부 서버와 연결
A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git remote # 원격 서버 확인

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git remote add origin https://github.com/OfficialSeonyeong/TIL.git
# 원격 저장소 정보 추가(해당 원격 주소 처음 사용 시)

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git remote -v #원격 서버와 연결
origin  https://github.com/OfficialSeonyeong/TIL.git (fetch)
origin  https://github.com/OfficialSeonyeong/TIL.git (push)

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git remote
origin

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git push origin master # 원격 저장소에 push
Enumerating objects: 3, done.
Counting objects: 100% (3/3), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 2.07 KiB | 707.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/OfficialSeonyeong/TIL.git
 * [new branch]      master -> master

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ cd TIL
bash: cd: TIL: No such file or directory

#실습(새로운 파일 만들어서 새로운 버전 만들기)
A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ ls
00_markdown.md  01_markdown.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git add 01_markdown.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
        new file:   01_markdown.md


A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git commit -m "more study"
[master 568b5cb] more study
 1 file changed, 143 insertions(+)
 create mode 100644 01_markdown.md

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git status
On branch master
nothing to commit, working tree clean

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git log
commit 568b5cbf9e375a3a563e9046dc3549368272f1f6 (HEAD -> master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 17:07:15 2020 +0900

    more study

commit f2e33481a50fe347b699198595cb8d5a3e100c05 (origin/master)
Author: 윤선영 <sunday.myday2@gmail.com>
Date:   Tue Sep 15 15:46:26 2020 +0900

    First commit


A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git log --oneline
568b5cb (HEAD -> master) more study
f2e3348 (origin/master) First commit

A@DESKTOP-BDHGJBV MINGW64 ~/TIL (master)
$ git push origin master
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 4 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 1.64 KiB | 560.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/OfficialSeonyeong/TIL.git
   f2e3348..568b5cb  master -> master
```



