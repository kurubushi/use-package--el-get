# use-package/:el-get

`use-package/:el-get` adds `:el-get` keyword to `use-package`.
If `use-package` has `:el-get pkgname` section and `pkgname` is not installed,
`use-package` installs `pkgname` with `el-get` between `:init` and `:config` sections automatically.

Flow of execution is
1. `:init` section
1. `:el-get` section
1. `:config` section


## install

```
;; install :el-get keyword to use-package
(require 'el-get)
(el-get-bundle! use-package--el-get
  :type    github
  :pkgname "kurubushi/use-package--el-get")
```


## example

```elisp
(use-package evil
  :el-get evil
  :init
    (setq evil-want-C-u-scroll t)
  :config
    (evil-mode 1))
```

```elisp
(use-package magit
  :el-get (magit magit-popup))
```


## demo

If we have a `use-package--el-get-test.rcp`

```elisp
(:name      use-package--el-get-test
 :type      github
 :pkgname   "kurubushi/use-package--el-get"
 :load-path "demo")
```

when we execute the following code

```elisp
;; demo
;; (el-get-remove 'use-package--el-get-test) remove this demo
(use-package use-package--el-get-test
  :el-get use-package--el-get-test
  :init
    (message "[use-package] :init")
  :config
    (message "[use-package] :config"))
```

we obtain the following log

```text
[use-package] :init
Source file ‘/home/kurubushi/.emacs.d/el-get/.loaddefs.el’ newer than byte-compiled file
el-get is waiting for "*git clone use-package--el-get-test*" to complete
el-get: Package use-package--el-get-test installed.
el-get is waiting for "*git submodule update*" to complete
el-get: git submodule update ok
el-get is waiting for "byte-compile" to complete
el-get: el-get-build use-package--el-get-test: byte-compile ok.
el-get: updating autoloads for use-package--el-get-test
Saving file /home/kurubushi/.emacs.d/recentf...
Wrote /home/kurubushi/.emacs.d/recentf
Generating autoloads for use-package--el-get-test/demo/use-package--el-get-test.el...done
Wrote /home/kurubushi/.emacs.d/el-get/.loaddefs.el [2 times]
el-get: byte-compiling autoload file
Wrote /home/kurubushi/.emacs.d/el-get/.loaddefs.elc
use-package--el-get-test installed: This package has been installed successfully by el-get.
el-get install use-package--el-get-test
[use-package] :config
t
```
