# Github-Usefullinfo

## To revert the changes done to the local working directory
Git checkout .


## GIT Reset command
There are 3 kinds of files Staged,Tracked and UnTracked
* Type 1. Staged Tracked files
* Type 2. Unstaged Tracked files
* Type 3. Unstaged UnTracked files a.k.a UnTracked files

* Staged - Those that are moved to staging area/ Added to index
* Tracked - modified files
* UnTracked - new files. Always unstaged. If staged, that means they are tracked.

## What each commands do:
* **```git checkout .```** - Removes Unstaged Tracked files ONLY [Type 2]
* **```git clean -n```** - shows the list of untracked files that will be deleted
* **```git clean -f```** - Removes Unstaged UnTracked files ONLY [Type 3]
* **```git reset HEAD <file_name>```** - Moves the file from Staged to Unstaged
* **```git reset --hard```** - Removes Staged Tracked and UnStaged Tracked files ONLY[Type 1, Type 2]
* **```git stash -u```** - Removes all changes [Type 1, Type 2, Type 3]



## Create review branch
    rake translations:generate  
    git checkout master  
    git status                      #To check nothing is checked out in master
    git pull  
    git checkout -b <review_branch>  
    git merge --squash <dev_branch>  
    git add .  
    git commit -am "<comments>"  
    git push origin <review_branch>  

## Merging from master into development branch
    git checkout master         |
    git status                  | #To check nothing is checked out in master
    git pull                    |
    git checkout <dev_branch>   |
    git merge master            |  git fetch origin && git merge origin/master 
    <resolve conflicts in files>  
    git status
    git add .  
    git commit -m “<comments>”  
    git push origin <dev_branch>  
## Merging from development branch into master
    Close the review   
    rake translations:generate  
    git checkout master 
    git status                     #To check nothing is checked out in master
    git pull  
    git merge —squash <dev_branch>   
    rake site 
    bundle install 
    git status  
    git add .  
    git commit -m “<comments>”  
    git push  
    rake docker:deploy  
    Move the JIRA to Engineering Complete  
 ## Git Stashing
    git stash  
    git stash apply  
    git stash list  
    
 ## Delete branches
     git push origin --delete <branch_name>  
     git push origin :<branch_name>  
  
 ## Making another branch as base for the code review(Example below)
     (339-dev) $ git checkout 596-dev
     (596-dev) $ git pull
     (596-dev) $ git checkout 339-dev
     (339-dev) $ git merge 596-dev
     # resolve conflicts
     (339-dev) $ git commit -am "Merged 596"
     (339-dev) $ git push -u
     (339-dev) $ git checkout 596-dev
     (596-dev) $ git checkout -b 339-review
     (339-review) $ git merge --squash 339-dev
     (339-review) $ git commit -am "Merged for review"
     (339-review) $ git push -u
     (339-review) $ git checkout 339-dev
     
go make the code review