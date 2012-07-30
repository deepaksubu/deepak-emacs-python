;;ewjdsfjsdjfdflkja;sdfjk
;;Deepak Python Support for emacs begin
(add-to-list 'load-path "~/.emacs.d/python/python-mode") 
(setq py-install-directory "~/.emacs.d/python/python-mode")
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;Deepak Support for Ipython
(add-to-list 'load-path "~/.emacs.d/python")
(require 'ipython)
(setq ipython-command "/.emacs.d/python/ipython")


;;Support for autocomplete
(add-to-list 'load-path "~/.emacs.d/python")
(require 'anything)
(require 'anything-ipython)
(when (require 'anything-show-completion nil t)
   (use-anything-show-completion 'anything-ipython-complete
                                 '(length initial-pattern)))

;;Deal with interpreter
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

;;Add pep8 and pylint to the mix
(require 'python-pep8)
(require 'python-pylint)

(defun python-add-breakpoint ()
  (interactive)
  (py-newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ 	]*import ipdb; ipdb.set_trace()"))

(define-key python-mode-map (kbd "C-c C-t") 'python-add-breakpoint)