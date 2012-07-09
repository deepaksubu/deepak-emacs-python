
;;Deepak Python Support for emacs begin
(add-to-list 'load-path "~/.emacs.d/python/python-mode") 
(setq py-install-directory "~/.emacs.d/python/python-mode")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;Deepak Support for Ipython
(add-to-list 'load-path "~/.emacs.d/python") 
(require 'ipython)
