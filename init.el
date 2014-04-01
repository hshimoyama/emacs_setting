;; 日本語に設定
(set-language-environment 'Japanese)
;; 文字コードをUTF-8
(prefer-coding-system 'utf-8)

;; ~/.emacs.d/site-lisp 以下をすべて読み込む
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

;; for init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
