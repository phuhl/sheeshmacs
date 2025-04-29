;;; elegant-dark-theme.el --- A very minimal but elegant and consistent theme
;;; Copyright (C) 2020 Nicolas P. Rougier and Nicolò Zorzetto
;;; -------------------------------------------------------------------
;;; Authors: Nicolas P. Rougier and Nicolò Zorzetto
;;; -------------------------------------------------------------------
;;; URL: https://github.com/rougier/elegant-emacs
;;; -------------------------------------------------------------------
;;; Version: 1
;;; Package-Requires: ((emacs "25.1"))
;;; -------------------------------------------------------------------
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software: you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program. If not, see <http://www.gnu.org/licenses/>
;;; -------------------------------------------------------------------
;;; Commentary:
;;; This theme offers an almost vanilla yet elegant Emacs experience
;;; -------------------------------------------------------------------
;;; Code:


;;; Theme definition
;;; -------------------------------------------------------------------
(deftheme elegant-dark
  "A simple yet elegant theme for emacs.")
;;; -------------------------------------------------------------------


;;; Require elegant-emacs-common
;;; -------------------------------------------------------------------
(load "~/.emacs.d/src/elegant.el")
(require 'elegant)
;;; -------------------------------------------------------------------


;;; General colors
;;; -------------------------------------------------------------------

(custom-theme-set-faces
 'elegant-dark

 '(cursor ((t (:foreground "#3f3f3f" :background "#dcdccc"))))
 '(outline-box ((t (:line-width 5 :color "#3f3f3f"))))

 '(default ((nil (
                  :foreground "#dcdccc"
                  :background "#3f3f3f"
                  :weight normal

                  :inherit nil :extend nil :stipple nil
                  :inverse-video nil :box nil :strike-through nil
                  :overline nil :underline nil :slant normal
                  :width normal :foundry "GOOG"
                  :family "Roboto Mono"))))
 '(face-critical ((nil (:foreground "#385f38"
                                    :background "#f8f893"))))
 '(face-popout ((nil (:foreground "#f0dfaf"
                                  :background "#3f3f3f"))))
 '(face-strong ((nil (:foreground "#dcdccc"
                                  :background "#3f3f3f"
                                  :weight bold))))
 '(italic ((nil (:slant italic
                        :foreground "#dcdccc"
                        :background "#3f3f3f"))))
 '(bold-italic ((nil (:slant italic
                             :foreground "#dcdccc"
                             :background "#3f3f3f"))))
 '(face-salient ((nil (:foreground "#dca3a3"
                                   :background "#3f3f3f"
                                   :weight normal))))
 '(face-salient-strong ((nil (:foreground "#a0008b" :background "#3f3f3f"
                                          :weight bold))))
 '(face-faded ((nil (:foreground "#b1b1a4" :background "#3f3f3f"
                                 :weight light))))
 '(face-subtle ((nil (:background "#7a7a7a" :foreground "#f5f5e7"))))
 '(face-backlit ((nil (:background "#000000" :foreground "#f0f0f0"))))
 '(face-underline-error((nil (:underline (:color "#f00" :style wave)))))
 '(face-underline-warning((nil (:underline (:color "#ffa07a" :style wave)))))



 '(header-line ((nil ( :underline "#dcdccc"))))
 '(mode-line ((nil ( :underline "#dcdccc"
                     :foreground "#3f3f3f"
                     :background "#3f3f3f"))))
 '(window-divider ((nil ( :foreground "#3f3f3f"))))
 '(window-divider-first-pixel ((nil ( :foreground "#3f3f3f"))))
 '(window-divider-last-pixel ((nil ( :foreground "#3f3f3f"))))


 '(rainbow-delimiters-depth-2-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "turquoise"))))
 '(rainbow-delimiters-depth-3-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "goldenrod"))))
 '(rainbow-delimiters-depth-4-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "spring green"))))
 '(rainbow-delimiters-depth-5-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "red3"))))
 '(rainbow-delimiters-depth-6-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
 '(rainbow-delimiters-depth-7-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "magenta"))))
 '(rainbow-delimiters-depth-8-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "lime green"))))
 '(rainbow-delimiters-depth-9-face
   ((t (:inherit rainbow-delimiters-base-face :foreground "tomato")))))


;; (elegant-buttons)
;;; -------------------------------------------------------------------

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


;;; Provide the elegant-emacs-dark theme
;;; -------------------------------------------------------------------
(provide-theme 'elegant-dark)
;;; -------------------------------------------------------------------


;;; elegant-dark-theme.el ends here

