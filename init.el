;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Benchmarking
(defvar *emacs-load-start* (current-time))


;; Load path etc:

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
;;(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session:

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up ELPA, the package manager:

(require 'package)
(package-initialize)
;;(require 'starter-kit-elpa)

;; Load up starter kit customizations:

(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
;; (require 'starter-kit-js)

(regen-autoloads)
(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here:

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))

;; Benchmarking
(message "My .emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*) (second
                                                       *emacs-load-start*)))))

(load "~/.emacs.d/vendor/pcmpl-ssh.el")

(add-to-list 'load-path "~/.emacs.d/vendor/color-theme-6.6.0")
(load "~/.emacs.d/vendor/color-theme-6.6.0/color-theme.el")
(global-set-key "\M-z" 'undo)
(global-set-key "\C-z" 'undo)
(menu-bar-mode)
(setq-default tab-width 1)
(setq compile-command "source ~/home/.bashrc.build_mac.sh; cd ~/mini; clangbuild gen_homo_hc")
(require 'color-theme)
(color-theme-initialize)
(color-theme-jsc-dark)


(provide 'init)

(load "~/.emacs.d/vendor/ess-5.13/lisp/ess-site")

(setq ns-command-modifier 'meta)
(setq ns-alternate-modifier 'suerp)
(set-frame-font "droid sanr mono-11")


;;; init.el ends here
