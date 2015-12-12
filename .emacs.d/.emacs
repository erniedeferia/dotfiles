;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'alt)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-to-list 'load-path "~/.emacs.d/")

;;; Emacs/W3 Configuration
(setq load-path (cons "/usr/share/emacs/site-lisp" load-path))
(condition-case () (require 'w3-auto "w3-auto") (error nil))

(defvar w3-fast-parse-tidy-program "/usr/local/bin/tidy")

(defun w3-tidy-page (&optional buff)
 "User html tidy to clean up the HTML in the current buffer."
 (save-excursion
    (if buff
      (set-buffer buff)
    (setq buff (current-buffer)))
  (widen)
  (call-process-region (point-min) (point-max)
                       w3-fast-parse-tidy-program
                      t (list buff nil) nil ;nil nil nil;
                     "--show-warnings" "no" "--show-errors" "0" "--force-output" "yes"
                     "-quiet" "-clean" "-bare" "-omit"
                     "--drop-proprietary-attributes" "yes" "--hidden-comments" "yes"
         )))

(add-hook 'w3-parse-hooks 'w3-tidy-page)


;;
;; emacs-color-theme-solarized
;; https://github.com/sellout/emacs-color-theme-solarized
;;
;; Thsi required download/install of color-theme package from
;; http://www.nongnu.org/color-theme/
;;
(add-to-list 'load-path "~/.emacs.d/themes/color-theme-6.6.0/")
(require 'color-theme)
(eval-after-load "color-theme"
   '(progn
      (color-theme-initialize)
      (color-theme-hober)))
;;(require 'color-theme-autoload "color-theme-autoloads")

(add-to-list 'load-path  "~/.emacs.d/themes/color-theme-solarized/")
(require 'color-theme-solarized)



; directory to put various el files into
(add-to-list 'load-path "~/.emacs.d/themes/")

; loads ruby mode when a .rb file is opened.
(autoload 'ruby-mode "ruby-mode" "Major mode for editing ruby scripts." t)
(setq auto-mode-alist  (cons '(".rb$" . ruby-mode) auto-mode-alist))


(add-to-list 'load-path "~/go/misc/emacs/")
; loads golang (go-lang, go) mode
(add-to-list 'load-path "~/go/misc/emacs/go-mode-load.el" t)
  (require 'go-mode-load)

(add-to-list 'load-path "~/.emacs.d/clojure-mode.el" t)

(add-hook 'clojure-mode-hook 'paredit-mode)

;;**********************************************************************************
;; The following block is to enable autocomplete for go-lang
;; loads company-mode auto-complete package
;;**********************************************************************************
(add-to-list 'load-path "~/.emacs.d/company-mode/")
(autoload 'company-mode "company" nil t) 

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "~/.emacs.d/company-go")
(require 'company-go)                                ; load company mode go backend
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-minimum-prefix-length 0)               ; autocomplete right after '.'
(setq company-idle-delay .3)                         ; shorter delay before autocompletion popup
(setq company-echo-delay 0)                          ; removes annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)))

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

;;*******************************************************************************

