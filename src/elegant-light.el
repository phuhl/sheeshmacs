;;; elegant-light-theme.el --- A very minimal but elegant and consistent theme
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
(deftheme elegant-light
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
  'elegant-light

  '(cursor ((t (:foreground "#111111" :background "#ffffff"))))
  '(outline-box ((t (:line-width 5 :color "#ffffff"))))

  '(default (( nil (
                    :background "#ffffff"
                    :foreground "#111111"
                    :weight light


                    :inherit nil :extend nil :stipple nil
                    :inverse-video nil :box nil :strike-through nil
                    :overline nil :underline nil :slant normal
                    :width normal :foundry "GOOG"
                    :family "Roboto Mono"))))
  '(face-critical (( nil ( :foreground "#ffffff"
                           :background "#ff6347"))))
  '(face-popout ((nil ( :foreground "#ffa07a"
                        :background "#ffffff"))))
  '(face-strong (( nil ( :foreground "#222222"
                         :background "#ffffff"
                         :weight bold))))
  '(italic ((nil ( :slant italic
                   :background "#ffffff"
                   :foreground "#111111"))))
  '(bold-italic ((nil ( :slant italic
                        :background "#ffffff"
                        :foreground "#111111"))))
  '(face-salient (( nil ( :foreground "#a0008b"
                          :background "#ffffff"
                          :weight light))))
  '(face-salient-strong (( nil ( :foreground "#a0008b"
                                 :background "#ffffff"
                                 :weight bold))))
  '(face-faded (( nil ( :foreground  "#999999"
                        :background "#ffffff"
                        :weight light))))
  '(face-subtle ((nil ( :foreground "#111111"
                        :background "#e0e0e0"))))
  '(face-backlit (( nil ( :background "#f0f0f0"
                          :foreground "#000000"))))

  '(face-underline-error nil
                         :underline (:color "#f00" :style wave))
  '(face-underline-warning nil
                           :underline (:color "#ffa07a" :style wave))


  '(header-line ((nil ( :underline "#111111"))))
  '(mode-line ((nil ( :underline "#111111"
                      :foreground "#ffffff"
                      :background "#ffffff"))))
  '(window-divider ((nil ( :foreground "#ffffff"))))
  '(window-divider-first-pixel ((nil ( :foreground "#ffffff"))))
  '(window-divider-last-pixel ((nil ( :foreground "#ffffff"))))

  '(rainbow-delimiters-depth-2-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "blue"))))
  '(rainbow-delimiters-depth-3-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "green"))))
  '(rainbow-delimiters-depth-4-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "goldenrod"))))
  '(rainbow-delimiters-depth-5-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "red4"))))
  '(rainbow-delimiters-depth-6-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "magenta"))))
  '(rainbow-delimiters-depth-7-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "cyan"))))
  '(rainbow-delimiters-depth-8-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "sea green"))))
  '(rainbow-delimiters-depth-9-face
    ((t (:inherit rainbow-delimiters-base-face :foreground "tomato"))))
  )


;;(elegant-buttons)
;;; -------------------------------------------------------------------


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;; Provide the elegant-emacs-dark theme
;;; -------------------------------------------------------------------
(provide-theme 'elegant-light)
;;; -------------------------------------------------------------------


;;; elegant-light-theme.el ends here
