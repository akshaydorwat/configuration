(require 'helm-cscope)

(add-hook 'csharp-mode-hook 'helm-cscope-mode)

;; Set key bindings
 (eval-after-load "helm-cscope"
   '(progn
      (define-key helm-cscope-mode-map (kbd "M-/") 'helm-cscope-find-this-symbol)
      (define-key helm-cscope-mode-map (kbd "M-.") 'helm-cscope-find-global-definition)
      (define-key helm-cscope-mode-map (kbd "M-,") 'helm-cscope-pop-mark)
      (define-key helm-cscope-mode-map (kbd "M-n") 'helm-cscope-find-called-function)
      (define-key helm-cscope-mode-map (kbd "M-m") 'helm-cscope-find-calling-this-funtcion)))

;; key bindings
;;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;(define-key helm-gtags-mode-map (kbd "M-/") 'helm-gtags-find-rtag)
;;(define-key helm-gtags-mode-map (kbd "M-f") 'helm-gtags-find-files)
;;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(provide 'setup-helm-cscope)
