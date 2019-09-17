(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-message t)

(defalias 'yes-or-no-p 'y-or-n-p)

(defconst demo-packages
  '(anzu
    duplicate-thing
    helm
    helm-gtags
    helm-swoop
    ;; function-args
    clean-aindent-mode
    comment-dwim-2
    dtrt-indent
    ws-butler
    iedit
    magit
    ;;yasnippet
    auto-complete
    smartparens
    volatile-highlights
    undo-tree
    zygospore))

(defun install-packages ()
  "Install all required packages."
  (interactive)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package demo-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)

;; this variables must be set before load helm-gtags
;; you can change to any prefix key of your choice
(setq helm-gtags-prefix-key "\C-cg")

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-helm)
(require 'setup-helm-gtags)
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm-cscope)
(windmove-default-keybindings)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)


;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq
 c-default-style "linux" ;; set style to "linux"
 )

(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))

;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'prog-mode-hook 'ws-butler-mode)

;; Package: helm-gtags
(require 'helm-gtags)
(add-hook 'python-mode-hook 'helm-gtags-mode)
(add-hook 'objc-mode-hook 'helm-gtags-mode)
(add-hook 'lua-mode-hook 'helm-gtags-mode)

;; Package: yasnippet
;;(require 'yasnippet)
;;(yas-global-mode 1)

;; Package: smartparens
;;(require 'smartparens-config)
;;(setq sp-base-key-bindings 'paredit)
;;(setq sp-autoskip-closing-pair 'always)
;;(setq sp-hybrid-kill-entire-symbol nil)
;;(sp-use-paredit-bindings)

(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; Package zygospore
(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows)

;; Set xterm mouse mode on
;;(xterm-mouse-mode 1)


;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; sync scrolling
(global-set-key [(control up)]  (lambda () (interactive) (scroll-up   1)) )
(global-set-key [(control down)]  (lambda () (interactive) (scroll-down 1)) )

(global-set-key [(f2)] 'scroll-all-mode)
(global-set-key [(f3)] 'toggle-case-fold-search)
(global-set-key [(f4)] 'xterm-mouse-mode)

;; load theme
(load-theme 'tango-dark t)
(set-face-attribute 'highlight nil :foreground 'unspecified)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(region ((t (:inherit nil :background "RoyalBlue4")))))

;; clear command for eshell
(defun eshell/clear ()
    "04Dec2001 - sailor, to clear the eshell buffer."
      (interactive)
        (let ((inhibit-read-only t))
              (erase-buffer)))

(setq tab-width 4) ; or any other preferred value
(defvaralias 'c-basic-offset 'tab-width)

 ;; Usage: emacs -diff file1 file2
 (defun command-line-diff (switch)
   (let ((file1 (pop command-line-args-left))
	 (file2 (pop command-line-args-left)))
     (ediff file1 file2)))
 (add-to-list 'command-switch-alist '("diff" . command-line-diff))

(put 'erase-buffer 'disabled nil)

(setq x-select-enable-clipboard t)

(add-hook 'diff-mode-hook
          '(lambda ()
             (whitespace-mode 0)))
;; ediff to split window based on frame width
(setq ediff-split-window-function (if (> (frame-width) 150)
				      'split-window-horizontally
				    'split-window-vertically))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit lua-mode msvc zygospore ws-butler volatile-highlights undo-tree smartparens iedit helm-swoop helm-gtags helm-cscope fill-column-indicator duplicate-thing dtrt-indent csharp-mode comment-dwim-2 clean-aindent-mode auto-complete anzu)))
 '(safe-local-variable-values (quote ((comment-multi-line . t)))))
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(add-to-list 'auto-mode-alist '("\\.cs\\'" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.it\\'" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(global-set-key (kbd "C-x g") 'magit-status)
