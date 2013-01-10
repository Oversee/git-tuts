# encoding: utf-8

slide <<-EOS, :center
  \e[1mGit 101: An Introduction to Git\e[0m


  Derek Smith
  @clok, @derek-smith

  Oversee.net
EOS

slide <<-EOS, :center
  It is easy to shoot your foot off with git,
  but also easy to revert to a previous foot
  and merge it with your current leg.

  - Jack William Bell
EOS

section "Basic Configuration Files" do
  slide <<-EOS, :block
    \e[1mConfig File (.gitconfig)
    ------------------------\e[0m
    This is the basic config file that is globally set from the users home
    directory. (ex. /home/user/.gitconfig)

    You can add attributes to your .gitconfig by either editing the file
    directly or through CLI inputs.

    It is recommended that you set your user name and email address at a 
    global level.

  EOS

  slide <<-EOS, :block
    $:~/>\e[1m git config --global user.name "Derek Smith"\e[0m
    
    $:~/>\e[1m git config --global user.name\e[0m
    Derek Smith
    
    $:~/>\e[1m cat .gitconfig\e[0m
    [user]
       name = Derek Smith
       email = dsmith@oversee.net
    
    $:~/>
  EOS

  slide <<-EOS, :block
    My typical .gitconfig
    
    [user]
       name = Derek Smith
       email = dsmith@oversee.net
    [core]
       excludesFile = /home/dsmith/.gitignore_global
       editor = emacs -nw
    
  EOS

  slide <<-EOS, :block
    \e[1mGit Ignore (.gitignore)
    -----------------------\e[0m
    Include file extensions, names and negations. 

    You can set a global ignore if you like or you can add custom ignore files
    per repo.

  EOS

  slide <<-EOS, :block
    $:~/dev/malarkey/>\e[1m cat .gitognore\e[0m
    # Ignore compiled shared objects
    *.so
    
    # Ignore png image files
    *.png

    # Ignore a singular file
    a_very_SpeciFic_file.name

    # Ignore an entire directory and all sub dies and files
    etc/*

    # Negate the ignore above for a portion of files within etc/
    !etc/malarkey
    !etc/malarkey/*
    
    $:~/dev/malarkey/> 
  EOS
end

section "The Git Repo Basics" do
  slide <<-EOS, :center
    Git manages a repo from the root directory down.

    Unlike SVN, the entire repo is stored within one .git directory.
  EOS

  slide <<-EOS, :block
    \e[1mGit Init
    --------\e[0m
    To initialize a new simply use 'git init'

    This will initialize an empty repo in the current working directory.

    Any global configurations you have set will be applied.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m git init\e[0m
    Initialized empty Git repository in /home/dsmith/my_repo/.git/
    
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mGit Status
    ----------\e[0m
    Produces report of all modified, deleted and untracked files within a repo.

    Use this to determine what needs to be staged for commit.

    If a file meets the criteria in .gitignore then it will not be displayed in
    the status message.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m git status\e[0m
    # On branch master
    #
    # Initial commit
    #
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #	hello_git.txt
    nothing added to commit but untracked files present (use "git add" to track)

    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mGit Add
    -------\e[0m
    Stage all modifications to previously committed files and to any new files
    that you want to add to the repo. 

    Performing this command on a directory will recursively add all files.

  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m ls\e[0m
    hello_git.txt	new-file.pl	new-file.rb
    
    $:~/my_repo/>\e[1m git add new-file.*\e[0m
    $:~/my_repo/>\e[1m git status\e[0m
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #	new file:   new-file.pl
    #	new file:   new-file.rb
    #

    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mGit Commit
    ----------\e[0m
    Commit locally staged changes to the the local repo.
    
    Unlike 'svn commit' which will push to the shared repo.

    'git commit' will open the editor set in either the .gitconfig or by the
    'EDITOR' environment variable.

    After save & quiting the editor the commit will complete.

    Quiting the editor, w/o saving, will cancel the commit.

    '-m "<commit message>"'
    '-a' will automatically stage all tracked changes and commit them.
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m git commit -m "NEATO commit message"\e[0m
    [master (root-commit) 0bde0dd] Initial commit
    1 file changed, 1 insertion(+)
    create mode 100644 hello_git.txt
    
    $:~/my_repo/>\e[1m git log\e[0m
    commit 0bde0dddcc1107344e3bdbabc0cefb5a183c3a47
    Author: Derek Smith <dsmith@oversee.net>
    Date:   Wed Jan 9 12:18:28 2013 -0800

        NEATO commit message
     
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mGit Rm
    ------\e[0m
    Remove a tracked file from version control and the file system.

    If a file is not tracked within the repo, 'git rm' will ignore the file.

   EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m ls\e[0m
    hello_git.txt  file_to_delete
    
    $:~/my_repo/>\e[1m git rm file_to_delete \e[0m
    rm 'file_to_delete'
    
    $:~/my_repo/>\e[1m git status\e[0m
    # On branch master
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #	deleted:    file_to_delete
    #
    
    $:~/my_repo/>\e[1m git commit -m "Removed file_to_delete from repo"\e[0m
    [master 40f4fd4] Removed file_to_delete from repo
     1 file changed, 1 deletion(-)
     delete mode 100644 file_to_delete
    
    $:~/my_repo/>\e[1m ls\e[0m
    hello_git.txt
    
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mGit Branch
    ----------\e[0m
    Branching is fast and simple within git.

    Entire branch structure is contained within the repo.
  EOS

  slide <<-EOS, :block
    # Create a new branch named 'features'
    $:~/my_repo/>\e[1m git branch features\e[0m
    
    # List all local branches
    $:~/my_repo/>\e[1m git branch\e[0m
      feature
    * master

    # List all remote branches
    $:~/dev/malarkey>\e[1m git branch -r\e[0m
      github.corp/master
      github.corp/v4
      origin/master
      origin/v4

  EOS

  slide <<-EOS, :block
    \e[1mGit Checkout
    ------------\e[0m
    Switch to another working branch. 
  EOS

  slide <<-EOS, :block
    # Checkout a previously created branch.
    $:~/my_repo/>\e[1m git checkout <branch name>\e[0m

    # Create and checkout a newly named branch.
    $:~/my_repo/>\e[1m git checkout -B <branch name>\e[0m
    
    # Discard any uncommitted modifications and move the file back to the HEAD.
    $:~/my_repo/>\e[1m git checkout -- <file name>\e[0m 

  EOS
end

section "Now to bring the fun ..." do
  slide <<-EOS, :block
    \e[1mGit Clone
    ---------\e[0m
    The essential git command. 

    Similar to 'svn checkout' in that it will locally clone a remote repo.

    This major difference is that once a repo is cloned, all commits remain
    local until explicitly pushed to the remote origin.

    \e[1mgit clone <path to repo>\e[0m
  EOS

  slide <<-EOS, :block
    $:~/dev/>\e[1m git clone dsmith.dev:/home/dsmith/repos/git-demo.git\e[0m
    Initialized empty Git repository in /home/dsmith/dev/git-demo/.git
    Checking out files: 100% (113/113), done.

  EOS

  slide <<-EOS, :block
    \e[1mGit Remote
    ----------\e[0m
    The next essential git command.

    Remote allows you to add and remove remote repo paths.

    Essential for synchronizing multiple machines and repos.

  EOS

  slide <<-EOS, :block
    # Add a new remote repo
    $:~/github.corp/git-demo/>\e[1m git remote add github git@github.com:clok/git-tuts.git\e[0m

    # List all remote linked repos
    $:~/github.corp/git-demo/>\e[1m git remote -v\e[0m
    github	git@github.com:clok/git-tuts.git (fetch)
    github	git@github.com:clok/git-tuts.git (push)
    origin	dsmith@dsmith.dev.corp.oversee.net:~/repos/git-demo.git (fetch)
    origin	dsmith@dsmith.dev.corp.oversee.net:~/repos/git-demo.git (push)

    # Remove a remote repo link
    $:~/github.corp/git-demo/>\e[1m git remote rm github\e[0m
  EOS

  slide <<-EOS, :block
    \e[1mGit Fetch
    ---------\e[0m
    Check and retrieve an update from a remote repo and branch.

    The update will be stored in a branch called '<remote>/<branch>'
    
    # Fetch all remote/branches
    \e[1mgit fetch\e[0m

    # Fetch only a specific remote/branch
    \e[1mgit fetch <remote name> <branch name>\e[0m

  EOS

  slide <<-EOS, :block
    \e[1mGit Merge
    ---------\e[0m
    Straight forward, merge branch into current working branch.

    Git merges are VERY fast.

    By default, git will attempt to "fast-forward" the merge.

    A fast-forward merge is a merge where the pointers are adjusted, but no
    merge commit is created.

    Use '--no-ff' to have a merge commit created.
  EOS

  slide <<-EOS, :block
    # Perform the fetch 
    $:~/github/redis/>\e[1m git fetch origin unstable\e[0m
    From git://github.com/antirez/redis
     * branch            unstable   -> FETCH_HEAD

    # Then merge the fetched code
    $:~/github/redis/>\e[1m git merge origin/unstable\e[0m
    Updating be6cbd3..d7740fc
    Fast-forward
     CONTRIBUTING                                                   |    7 ++
     COPYING                                                        |    2 +-
    ...
     utils/install_server.sh                                        |    2 +
    132 files changed, 4403 insertions(+), 1007 deletions(-)
  EOS

  slide <<-EOS, :block
    \e[1mGit Pull
    --------\e[0m
    Basically a 'fetch + merge'

    Similar in function to 'svn update'
  EOS

  slide <<-EOS, :block
    # Perform the pull 
    $:~/github/redis/>\e[1m git pull origin unstable\e[0m
    remote: Counting objects: 9, done.
    remote: Compressing objects: 100% (5/5), done.
    remote: Total 7 (delta 4), reused 5 (delta 2)
    Unpacking objects: 100% (7/7), done.
    From git://github.com/antirez/redis
       776d987..a785986  master     -> origin/unstable
    Updating 776d987..a785986
    Fast-forward
     README.markdown |   28 ++++++++++++++++++++++++++++
     1 file changed, 28 insertions(+)
  EOS

  slide <<-EOS, :block
    \e[1mGit Push
    --------\e[0m
    Attempt to push all commits in local repo to remote repo.

    Similar in function to 'svn commit'
  EOS

  slide <<-EOS, :block
    # Perform the push
    $:~/github/git-demo/>\e[1m git push github master\e[0m
    Counting objects: 8, done.
    Delta compression using up to 8 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 4.00 KiB, done.
    Total 5 (delta 3), reused 0 (delta 0)
    To git@github.com:clok/git-tuts.git
       20f47b7..9b404fb  master -> master
  EOS
end

section "... More Advanced Fun ..." do
  slide <<-EOS, :block
    \e[1mBare Clone Repository
    ---------------------\e[0m
    Makes a publishable form of a repo.

    Preferable method for sharing a codebase among multiple developers.

    \e[1mgit clone --bare <path to repo>\e[0m

  EOS

  slide <<-EOS, :block
    # 
    $:~/>\e[1m git clone --bare /home/my/codebase/ /remote/repos/codebase.git\e[0m
  EOS

  slide <<-EOS, :block
    \e[1mSubmodules
    ----------\e[0m
    An external repo you want to use within another repo.

    NOTE:
    External code under git version control should NEVER be copied to a local repo.

    Use 'git submodule' to link the desired external code to your repo.

    If you need to modify the code in the submodule, then fork it and have a blast!
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m git submodule add git@github.com:clok/tt.git my-submodule\e[0m
    Cloning into 'my-submodule'...
    remote: Counting objects: 35, done.
    remote: Compressing objects: 100% (27/27), done.
    remote: Total 35 (delta 10), reused 23 (delta 3)
    Receiving objects: 100% (35/35), 5.30 KiB, done.
    Resolving deltas: 100% (10/10), done.
    
    $:~/my_repo/>\e[1m cat .gitmodules\e[0m
    [submodule "my-submodule"]
        path = my-submodule
        url = git@github.com:clok/tiny-timer.git
    
    $:~/my_repo/> 
  EOS

  slide <<-EOS, :block
    \e[1mCloning with Submodules
    -----------------------\e[0m
    $:~/some/dir>\e[1m git clone --recursive <path to repo/>\e[0m

    Or

    # Clone the repo
    $:~/some/dir>\e[1m git clone <path to repo/>\e[0m

    # Initialize all submodules in the .gitmodules file
    $:~/some/dir>\e[1m git submodule init\e[0m

    # Fetch the code for the submodules
    $:~/some/dir>\e[1m git submodule update\e[0m

  EOS

  slide <<-EOS, :block
    \e[1mThe Stash Hash
    --------------\e[0m
    The \e[1mgit stash\e[0m command will move unstaged changes to stash hash
    within the local repo.

    This will reset the repo back to HEAD. 

    A useful tool when merge conflicts arise or you just want to quickly discard
    changes. 

    The stash hash can be accessed at anytime within git and will always be
     there unless you drop the stash.
  EOS

  slide <<-EOS, :block
    # Move uncommitted changes to stash hash
    $:~/my_repo/>\e[1m git stash\e[0m
    Saved working directory and index state WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    HEAD is now at 42b6efc Added sanitize functions for table mode in Parser.pm
    
    # List all available stash objects
    $:~/my_repo/>\e[1m git stash list\e[0m
    stash@{0}: WIP on master: 42b6efc Added sanitize functions for table mode in Parser.pm
    stash@{1}: WIP on v4: 4bfd79e Updated documentation for DeviceAtlas.pm
    stash@{2}: WIP on master: 3fa9ee6 Added logging
    stash@{3}: WIP on v2.0: f8f1f98 Testing out RedisDB.pm
    
  EOS

  slide <<-EOS, :block
    \e[1detached Checkout
    ----------------\e[0m
    Checkout a named branch in a detached state.

    Will not have the ability to commit back to the repo unless given a name.

    Useful for code inspection and experimentation.

    \e[1mgit checkout <commit>\e[0m
  EOS

  slide <<-EOS, :block
    $:~/my_repo/>\e[1m git checkout f14c2d8240e7861902d4d0d481b9a04f3e567b3c\e[0m
    Note: checking out 'f14c2d8240e7861902d4d0d481b9a04f3e567b3c'.

    You are in 'detached HEAD' state. You can look around, make experimental
    changes and commit them, and you can discard any commits you make in this
    state without impacting any branches by performing another checkout.

    If you want to create a new branch to retain commits you create, you may
    do so (now or later) by using -b with the checkout command again. Example:

      git checkout -b new_branch_name

    HEAD is now at f14c2d8... Added analytics_table.pl build scripts
  EOS

  slide <<-EOS, :block
    \e[1mRebase a.k.a. Squash
    --------------------\e[0m
    \e[1mNote:\e[0m Do not squash commits that you've already shared with others.
    You're changing history and it will cause trouble for others.

    The most common use of this command is to take many commits and "squash"
    them into one mega commit.

    This can be useful in keeping a clean commit history, but it does remove the
    meta-data associated with the commits within.

  EOS
end

section "Thank you! Questions?" do
end

__END__
