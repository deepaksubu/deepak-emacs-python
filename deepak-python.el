;;Deepak Python Support for emacs begin
(add-to-list 'load-path "~/.emacs.d/python/python-mode") 
(setq py-install-directory "~/.emacs.d/python/python-mode")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-to-list 'load-path "~/.emacs.d/python") 
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)

(add-to-list 'load-path "~/.emacs.d/python")
(require 'ipython)


;;Add pep8 and pylint to the mix
(require 'python-pep8)
(require 'python-pylint)

(add-hook 'python-mode-hook
          #'(lambda () (push '(?' . ?')
                              (getf autopair-extra-pairs :code))
 (setq autopair-handle-action-fns
      (list #'autopair-default-handle-action
            #'autopair-python-triple-quote-action))))

(defun python-add-breakpoint ()
  (interactive)
  (py-newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ 	]*import ipdb; ipdb.set_trace()"))

(define-key python-mode-map (kbd "C-c C-t") 'python-add-breakpoint)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

(add-to-list 'load-path "~/.emacs.d/django-mode") 
(require 'django-html-mode)
(require 'django-mode)
(yas/load-directory "~/.emacs.d/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
;;(setq ipython-completion-command-string "print(';'.join(get_ipython().Completer.complete('%s')[1])) #PYTHON-MODE SILENT\n")
