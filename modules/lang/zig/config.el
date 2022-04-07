;;; lang/zig/config.el -*- lexical-binding: t; -*-

(after! projectile
  (add-to-list 'projectile-project-root-files "build.zig"))


;;
;;; Packages

(use-package! zig-mode
  :hook (zig-mode . rainbow-delimiters-mode)
  :config
  (setq zig-format-on-save nil) ; rely on :editor format instead

  (when (featurep! +lsp)
    (add-hook 'zig-mode-local-vars-hook #'lsp! 'append))

  (map! :localleader
        :map zig-mode-map
        "b" #'zig-compile
        "f" #'zig-format-buffer
        "r" #'zig-run
        "t" #'zig-test-buffer))
