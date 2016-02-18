;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get-bundle dash)
(el-get-bundle s)
(el-get-bundle spaceline)
(el-get-bundle nyan-mode)
(el-get-bundle projectile)
(el-get-bundle helm)
(el-get-bundle helm-projectile)
(el-get 'sync)

(require 'spaceline)
(require 'spaceline-config)
(require 'nyan-mode)
(spaceline-emacs-theme)

(nyan-mode t)
(setq spaceline-minor-modes-separator " ")
(diminish 'auto-complete-mode "⊕")
(diminish 'paredit-mode "(p)")
(diminish 'undo-tree-mode "⎌")
(diminish 'eldoc-mode "ℹ")
(diminish 'elisp-slime-nav-mode "(n)")
(diminish 'volatile-highlights-mode "")
(diminish 'yas-minor-mode "⋮")


(eval-after-load "projectile"
  '(diminish 'projectile-mode))


(projectile-global-mode)
(setq projectile-indexing-method 'alien)

(require 'helm-config)

(global-set-key (kbd "M-x") 'helm-M-x)
(linum-mode)
(setq linum-format "%4d  ")
