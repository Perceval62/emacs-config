;; Vincent Perrier 07-05-2020
(provide 'shortcuts)

(global-set-key (kbd "<f2> <f2>")
                'ff-find-other-file)
(global-set-key (kbd "\C-s")
                'save-buffer)
(global-set-key (kbd "<f5> <f5>")
                (lambda ()
                  (interactive)
                  (shell-command "make")))

(defun gen-pdf ()
  "Builds a pdf preview of the mardown file as I edit and save"
  (if (eq (executable-find "pandoc") nil)
      (error "Pandoc is not installed"))

  (if (string-suffix-p ".md" buffer-file-name t)
      (shell-command (concat "pandoc -o doc.pdf " buffer-file-name))))

(add-hook 'after-save-hook 'gen-pdf )   