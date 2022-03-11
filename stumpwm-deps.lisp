(load (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname)))
(ql:add-to-init-file)
(ql:quickload '("alexandria" "clx" "cl-ppcre"))

