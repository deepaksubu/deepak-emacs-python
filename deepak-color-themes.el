;;deepak-color-themes
;;kkkree
(add-to-list 'load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/themes/color-theme-6.6.0/themes") 
(require 'color-theme)
(color-theme-initialize)
(load "~/.emacs.d/themes/zenburn")
(color-theme-zenburn)