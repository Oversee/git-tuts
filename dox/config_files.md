Git Configuration Files
=======================
---

Config File (.gitconfig)
--------------------------
This is the basic config file that is globally set from the users home directory. (ex. /home/user/.gitconfig)

Minimal Contents:
```
[user]
	name = John Doe
	email = jdoe@oversee.net
```

Useful *[core]* attributes to use:
- *excludesfile* will allow you to set global ignore settings
- *editor* will let you set the editor git will use for commit messages and other prompts. The default editor is vi/vim and can be overwritten by the environment variable **EDITOR**.


Sample:
```
[user]
	name = John Doe
	email = jdoe@oversee.net
[core]
	excludesFile = /home/jdoe/.gitignore_global
	editor = emacs -nw
```

Git Ignore (.gitignore)
-------------------------
Include file extensions, names and negations. You can set a global level ignore file in your *.gitconfig* and you can include a repo level *.gitignore* at the root of the repository.

Sample:
```
# Ignore compiled shared objects
*.so

# Ignore png image files
*.png

# Ignore a singular file
a_very_SpeciFic_file.name

# Ignore an entire directory and all sub dirs and files
etc/*

# Negate the ignore above for a portion of files within etc/
!etc/malarkey
!etc/malarkey/*
```

Note that if a file is committed to the repo and then it is added to the ignore list, git will continue to track it. If you want to remove it from tracking use ```git rm <file name>``` to remove the file from the repo and commit the changes.

Submodules (.gitmodules)
------------------------
This is a file that will be generated when *submodules* are added to your repo. You can also create the file by hand to add/manage the submodules you would like to use for a repo.

```git
[submodule "coffee-mode"]
	path = coffee-mode
	url = git://github.com/defunkt/coffee-mode.git
[submodule "scss-mode"]
	path = scss-mode
	url = git://github.com/antonj/scss-mode.git
[submodule "json-mode"]
	path = json-mode
	url = git://github.com/chad3814/json-mode.git
[submodule "yaml-mode"]
	path = yaml-mode
	url = git://github.com/yoshiki/yaml-mode.git
[submodule "less-mode"]
	path = less-mode
	url = git://github.com/myfreeweb/less-mode.git
[submodule "enhanced-ruby-mode"]
	path = enhanced-ruby-mode
	url = git://github.com/jacott/Enhanced-Ruby-Mode.git
[submodule "markdown-mode"]
	path = markdown-mode
	url = git://github.com/defunkt/markdown-mode.git
```
