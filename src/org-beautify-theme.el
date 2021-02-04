;;; org-beautify-theme.el --- A sub-theme to make org-mode more beautiful.
;; Copyright (C) 2014-2017 Jonathan Arkell

;; Author: Jonathan Arkell <jonnay@jonnay.net>
;; Version: 0.4
;; Created: 5 Oct 2012
;; Keywords: org theme

;; This file is not part of GNU Emacs.
;; Released under the GPL v3.0
;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Code:

(deftheme org-beautify "Sub-theme to beautify org mode")

(defcustom org-beautify-theme-use-box-hack 't
  "Use a 3 pixel box with the background color to add spacing.
Note that this has a side effect that can make the theme look
really bad under some circumstances."
  :type 'boolean)

(let* ((sans-font (cond ((x-list-fonts "Lucida Grande") '(:font "Lucida Grande"))
                        ((x-list-fonts "Verdana") '(:font "Verdana"))
                        ((x-family-fonts "Sans Serif") '(:family "Sans Serif"))
                        (nil (warn "Cannot find a Sans Serif Font.  Please report at: https://github.com/jonnay/org-beautify-theme/issues"))))
       (base-font-color (face-foreground 'default  nil 'default))
       (background-color (face-background 'default nil 'default))
       (headline `(:inherit default :foreground ,base-font-color))
       (padding (if org-beautify-theme-use-box-hack
                    `(:line-width 5 :color ,background-color)
                    nil)))
  (custom-theme-set-faces
   'org-beautify
   `(org-agenda-date
     ((t (:inherit org-agenda-structure :foreground "#666666" :height 0.8))))
   `(org-agenda-date-today
     ((t (:inherit org-agenda-date
                   :background ,(face-foreground 'org-agenda-done nil 'default)
                   :foreground "#000000" :box nil
                   :underline nil :weight bold :height 1.1))))
   `(org-agenda-structure
     ((t (:inherit default
                   :box nil
                   :underline nil :weight bold
                   :height 1.2))))
   `(org-level-8 ((t (,@headline ,@sans-font :height 1.1))))
   `(org-level-7 ((t (,@headline ,@sans-font :height 1.1))))
   `(org-level-6 ((t (,@headline ,@sans-font :height 1.1))))
   `(org-level-5 ((t (,@headline ,@sans-font :height 1.1))))
   `(org-level-4 ((t (,@headline ,@sans-font :height 1.1))))
   `(org-level-3 ((t (,@headline ,@sans-font :height 1.2 :box ,padding))))
   `(org-level-2 ((t (,@headline ,@sans-font :height 1.3 :box ,padding))))
   `(org-level-1 ((t (,@headline ,@sans-font :height 1.5  :box ,padding ))))
   `(org-document-title
     ((t (:inherit org-level-1 :height 2.0 :underline nil :box ,padding))))
   `(org-block-begin-line
     ((t :foreground ,base-font-color :background, background-color)))
   `(org-block-end-line
     ((t :foreground ,base-font-color :background, background-color)))
   `(org-block ((t (:box nil))))
   `(org-checkbox
     ((t (:foreground "#000000", :background "#93a1a1"
                      :box (:line-width -3 :color "#93a1a1" :style "released-button")))))

   `(org-headline-done ((t (:strike-through t))))
   `(org-done ((t (:strike-through t))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; Local Variables:
;; no-byte-compile: t
;; End:

(provide-theme 'org-beautify)
;;; org-beautify-theme.el ends here
