Advanced Git Commands
=====================

**"It is easy to shoot your foot off with git, but also easy to revert to a previous foot and merge it with your current leg."**

*Jack William Bell*

Git Rebase
----------
```git rebase``` will move the current working branch forward to the master HEAD. This is a powerful tool to work with managing versions and complex branching systems, but in my opinion is more dangerous a tool when working with multiple programmers. The most ccommon use of this command is to take many commits and "squash" them into one mega commit. This can be useful in keeping a clean commit history, but it does remove the meta-data associated with the commits withiun. The git-log will contain the commit comments along with the hash keys, but you will lose the ability to got to that specific commit or diff against it.

[Detailed explination](http://git-scm.com/docs/git-rebase)
[Practical exmaple of usage](https://ariejan.net/2011/07/05/git-squash-your-latests-commits-into-one)

Git Submodule
-------------
- ```git submodule add <path to repo> <dir name>```
- ```git submodule init```
- ```git submodule update```

Bare Clone
----------
- ```git clone --bare <path to repo>```

Clone with Submodules
---------------------
- ```git clone <path to repo>```
- ```git submodules init```
- ```git submodules update```

Or

- ```git clone --recursive <path to repo>```