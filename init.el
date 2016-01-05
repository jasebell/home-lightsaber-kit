;; Everything will be configured using packages from melpa or
;; elsewhere. This is a minimal setup to get packages going.
(require 'package)
(setq package-archives '(("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("elpa" . "http://elpa.gnu.org/packages/")))

;; This means we prefer things from ~/.emacs.d/elpa over the standard
;; packages.
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(defvar use-package-verbose t)
(require 'bind-key)
(require 'diminish)

(use-package emacs-lisp
  :init
  (add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'emacs-lisp-mode-hook #'show-paren-mode)
  (add-hook 'emacs-lisp-mode-hook #'paredit-mode))

(use-package magit
  :ensure t
  :pin melpa-stable)

(use-package projectile
  :ensure t
  :pin melpa-stable
  :init
  (setq projectile-enable-caching t)
  :diminish projectile-mode
  :config
  (projectile-global-mode 1))

(use-package company
  :ensure t
  :pin melpa-stable
  :diminish company-mode
  :config
  (global-company-mode))

(use-package highlight-symbol
  :ensure t
  :pin melpa-stable
  :defer t)

(use-package paredit
  :ensure t
  :pin melpa-stable
  :defer t
  :diminish paredit-mode)

(use-package eldoc
  :diminish eldoc-mode)

(use-package rainbow-delimiters
  :ensure t
  :pin melpa-stable
  :defer t)

;; Display Tweaking
(load-theme 'wheatgrass)
