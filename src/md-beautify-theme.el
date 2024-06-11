
;;; Code:

(deftheme md-beautify "Sub-theme to beautify md mode")

(let* ((sans-font (cond ((x-list-fonts "Lucida Grande") '(:font "Lucida Grande"))
                        ((x-list-fonts "Verdana") '(:font "Verdana"))
                        ((x-family-fonts "Sans Serif") '(:family "Sans Serif"))
                        (nil (warn "Cannot find a Sans Serif Font."))))
       (base-font-color (face-foreground 'default  nil 'default))
       (background-color (face-background 'default nil 'default))
       (headline `(:inherit default :foreground ,base-font-color)))
  (custom-theme-set-faces
   'md-beautify

   `(markdown-header-face-8 ((t (,@headline ,@sans-font :height 1.1))))
   `(markdown-header-face-7 ((t (,@headline ,@sans-font :height 1.1))))
   `(markdown-header-face-6 ((t (,@headline ,@sans-font :height 1.1))))
   `(markdown-header-face-5 ((t (,@headline ,@sans-font :height 1.1))))
   `(markdown-header-face-4 ((t (,@headline ,@sans-font :height 1.15))))
   `(markdown-header-face-3 ((t (,@headline ,@sans-font :height 1.2))))
   `(markdown-header-face-2 ((t (,@headline ,@sans-font :height 1.4))))
   `(markdown-header-face-1 ((t (,@headline ,@sans-font :height 1.8))))
   `(markdown-code-face ((t :background ,(face-background 'face-backlit)
                            :extend t)))
   `(markdown-pre-face ((t :background ,(face-background 'face-backlit)
                           :extend t)))
   `(markdown-language-keyword-face
     ((t :background ,(face-background 'face-backlit)
         :extend t
         :foreground ,(face-foreground 'face-salient))))))


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; Local Variables:
;; no-byte-compile: t
;; End:

(provide-theme 'md-beautify)
;;; md-beautify-theme.el ends here
