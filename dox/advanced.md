Advanced Git Commands
=====================

**"It is easy to shoot your foot off with git, but also easy to revert to a previous foot and merge it with your current leg."**

*Jack William Bell*

Bare Clone Repository
---------------------
Creating a bare repository will make a publishable form of your repo. This is how you accommodate sharing code among developers. In essence, creating a bare clone creates the central repository that you can clone from and remote link to. This is a major tenant of the git architecture. The bare repository will only contain the *.git* file system and none of the raw code.
- ```git clone --bare <path to repo>```

Example:

```git clone --bare /home/my/codebase/ /remote/repos/codebase.git``` will create a bare repository at ```/remote/repos/codebase.git```. We can then either clone from that bare repo with ```git clone /remote/repos/codebase.git``` or add it as a remote to an existing repo with ```git remote add shared_repo /remote/repos/codebase.git```.

Git Rebase
----------
```git rebase``` will move the current working branch forward to the master HEAD. This is a powerful tool to work with managing versions and complex branching systems, but in my opinion is more dangerous a tool when working with multiple developers. The most common use of this command is to take many commits and "squash" them into one mega commit. This can be useful in keeping a clean commit history, but it does remove the meta-data associated with the commits within.

- **Note:** do not squash commits that you've already shared with others. You're changing history and it will cause trouble for others.

[Detailed explanation](http://git-scm.com/docs/git-rebase)
[Practical example of usage](https://ariejan.net/2011/07/05/git-squash-your-latests-commits-into-one)

Git Submodule
-------------
A git *submodule* is an external repo that you add to your current repo. When you add the *submodule* you can point to a direct commit or by default it will point to the latest commit to master. This *submodule* will remain outside your local git version control and will remain pointed at the commit that was added unless edited otherwise. This is a powerful tool for linking dependencies to your repo without copying the code to the repo. **External code under git version control should NEVER be copied to a local repo.** Most likely you will not be modifying the contents of your dependencies, so submodule it. If you find that you need to modify the code, fork that repo and *submodule* the fork.
- ```git submodule add <path to repo> <dir name>``` will add the *submodule* to the local repo in the directory path provided.

Cloning with Submodules
-----------------------
- ```git clone --recursive <path to repo>``` will clone all submodules in the repo's *.gitmodules* file.

Or you can do the steps by hand

- ```git clone <path to repo>```
- ```git submodule init``` will initialize all *submodules* in the *.gitmodules* file. 
- ```git submodule update``` will fetch the code for the *submodules*.

Detached Checkout
------------------
- ```git checkout --detach <commit>``` will checkout a named branch (at the commit level) in a detached state that is useful for inspection and experimentation. This will not have the ability to merge back into the repo unless the detached HEAD is renamed as a new branch.

Git Stash
---------
- ```git stash``` will move all unstaged changes to a stash hash in the repo. This will effective reset you back to HEAD except for non committed staged changes. This is a very useful tool when merge conflicts arise or you just want to quickly discard changes. The stash hash can be accessed at anytime within git and will always be there unless you drop the stash.
