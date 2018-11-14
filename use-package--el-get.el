;;; use-package--el-get.el --- Add :el-get keyword to use-package
;;
;; Copyright (C) 2018 kurubushi
;;
;; Author: kurubushi <krbshi@gmail.com>
;; Version: 0.1
;; Created: 2018-11-14
;; Licence: MIT

(require 'use-package)
(require 'el-get)

(defun insert-to-list (x y zs)
  (if (null zs)
      (error "insert-to-list: %s is not in the list." y)
    (let ((z (car zs))
          (zs (cdr zs)))
      (if (eq y z)
          `(,x ,y . ,zs)
        `(,z . ,(insert-to-list x y zs))))))

(defun append-to-list (x y zs)
  (if (null zs)
      (error "insert-to-list: %s is not in the list." y)
    (let ((z (car zs))
          (zs (cdr zs)))
      (if (eq y z)
          `(,y ,x . ,zs)
        `(,z . ,(append-to-list x y zs))))))


(setq use-package-keywords (append-to-list :el-get :init use-package-keywords))
(defalias 'use-package-normalize/:el-get 'use-package-normalize-symlist)
(defun use-package-handler/:el-get (name keyword args rest state)
  (let ((name-s (use-package-as-string name)))
    (use-package-concat
     `((el-get 'sync ',args))
     (use-package-process-keywords name rest state))))


(provide 'use-package--el-get)
