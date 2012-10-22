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

;;
(require 'ac-python)
;;(define-key python-mode-map (kbd "M-") 'anything-ipython-complete)
;;(define-key python-shell-map (kbd "M-") 'anything-ipython-complete)
;;(define-key python-mode-map (kbd "C-c M") 'anything-ipython-import-modules-from-buffer)

;;Deal with interpreter
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

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

(setq ipython-completion-command-string "print(';'.join(get_ipython().Completer.complete('%s')[1])) #PYTHON-MODE SILENT\n")
