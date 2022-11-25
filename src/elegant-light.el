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
(set-background-color "#ffffff")
(set-foreground-color "#111111")
(set-face-attribute 'default nil
        :foreground (face-foreground 'default)
        :background (face-background 'default)
        :weight 'light)
(set-face-attribute 'face-critical nil :foreground "#ffffff"
        :background "#ff6347")
(set-face-attribute 'face-popout nil :foreground "#ffa07a")
(set-face-attribute 'face-strong nil :foreground "#222222"
                    :weight 'bold)
(set-face-attribute 'italic nil :slant 'italic)
(set-face-attribute 'bold-italic nil :slant 'italic)
(set-face-attribute 'face-salient nil :foreground "#a0008b"
        :weight 'light)
(set-face-attribute 'face-salient-strong nil :foreground "#a0008b"
        :weight 'bold)
(set-face-attribute 'face-faded nil :foreground  "#999999"
        :weight 'light)
(set-face-attribute 'face-subtle nil :background "#e0e0e0")
(set-face-attribute 'face-backlit nil :background "#f0f0f0" :foreground "#000000")

(set-face-attribute 'face-underline-error nil
                    :underline '(:color "#f00" :style wave))
(set-face-attribute 'face-underline-warning nil
                    :underline '(:color "#ffa07a" :style wave))


(elegant-buttons)
;;; -------------------------------------------------------------------


;;; Provide the elegant-emacs-dark theme
;;; -------------------------------------------------------------------
(provide-theme 'elegant-light)
;;; -------------------------------------------------------------------


;;; elegant-light-theme.el ends here
