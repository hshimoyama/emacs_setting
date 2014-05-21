(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (setq tab-width 2)
	     (setq indent-tabs-mode nil)
	     (setq ruby-indent-level tab-width)
	     (setq ruby-deep-indent-paren-style nil)
	     (custom-set-variables '(ruby-insert-encoding-magic-comment nil))
	     (defadvice ruby-indent-line (after unindent-closing-paren activate)
	       (let ((column (current-column))
		     indent offset)
		 (save-excursion
		   (back-to-indentation)
		   (let ((state (syntax-ppss)))
		     (setq offset (- column (current-column)))
		     (when (and (eq (char-after) ?\))
				(not (zerop (car state))))
		       (goto-char (cadr state))
		       (setq indent (current-indentation)))))
		 (when indent
		   (indent-line-to indent)
		   (when (> offset 0) (forward-char offset)))))))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle 'overlay)
	     
(require 'rcodetools)
