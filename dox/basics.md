Git Basics
==========

Git Init
--------
Git manages a repo from the root directory down. To initialize a new repo, simply use ```git init```.  This will initialize a new git repo in the directory. Any global configurations you have set will be applied to the newly initialized repo.

Git Status
----------
```git status``` will produce a helpful report of all modified, deleted and untracked files within your repo. Use this to determine what needs to be staged for commit. If a file meets the criteria in the *.gitignore* file then it will not be displayed in the status message.

Git Add/Rm
----------
You will use ```git add``` to stage all modifications to previously committed files and to any new files that are added. Performing this command on a directory will add all files below it recursively.

```git rm``` will remove a tracked file from version control and the file system. If a file is not tracked within the repo, ```git rm``` will ignore the file.

Git Commit
----------
```git commit``` will commit locally staged changes to the the local repo, unlike ```svn commit``` which will push to the shared repo.
- ```git commit``` will open the editor set in either the *.gitconfig* or by the ```$EDITOR``` environment value. After entering a commit message or save & quiting the editor the commit will complete. Just quiting the editor will cancel the commit.
- ```git commit -m "<commit message>"```
- ```git commit -a``` will automatically stage all tracked changes and commit them.

Git Branch
----------
- ```git branch <name>``` will create a new named branch.
- ```git branch``` will list all local branches.
- ```git branch -r``` will list all remote branches.

Git Checkout
------------
- ```git checkout <branch name>``` will checkout a previously created branch.
- ```git checkout -B <branch name>``` will create and checkout a newly named branch.
- ```git checkout -- <file name>``` will discard any uncommitted modifications and move the file back to the HEAD.

Git Merge
---------
- ```git merge <branch name>``` will merge the input branch into the current branch.

Git Clone
---------
```git clone <path to repo>``` is Similar in function to the ```svn checkout```, but it copy the repo to a local dir and will only commit to that local clone.  In order to commit local changes to the remote remote you cloned, you must perform a **push**.

Git Fetch
---------
- ```git fetch <remote path> <branch>``` will retrieve from an update from a remote repo and store in *<remote name>/<branch name>* branch. This will typically default to ```git fetch origin <branch>```. If you want to specify the remote repo to pull from just use ```git fetch <remote> <branch name>```.

Git Pull
--------
- ```git pull <remote path> <branch name>``` is basically a **fetch + merge**. This will typically default to ```git pull origin <branch>```. If you want to specify the remote repo to pull from just use ```git fetch <remote> <branch name>```. Similar in function to ```svn update```.

Git Push
--------
The opposite of pull. This will attempt to push committed changes to a remote repo. This will typically default to ```git push origin <branch>```. If you want to specify the remote repo to pull from just use ```git push <remote> <branch name>```.
