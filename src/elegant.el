;;; elegant.el --- A very minimal but elegant and consistent theme
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






;;; When we set a face, we take care of removing any previous settings
;;; -------------------------------------------------------------------
(defun set-face (face style)
  "Reset a FACE and make it inherit STYLE."
  (set-face-attribute face nil
   :foreground 'unspecified :background 'unspecified
   :family     'unspecified :slant      'unspecified
   :weight     'unspecified :height     'unspecified
   :underline  'unspecified :overline   'unspecified
   :box        'unspecified :inherit    style))
;;; -------------------------------------------------------------------


;;; A theme is fully defined by these six faces
;;; -------------------------------------------------------------------
(defgroup elegance nil
  "Faces for the elegance theme"
  :prefix "elegance-face-"
  :group 'faces)
;;; -------------------------------------------------------------------


;;; Custom faces definition
;;; -------------------------------------------------------------------
(defface face-critical nil
"Critical face is for information that requires immediate action.
It should be of high constrast when compared to other faces. This
can be realized (for example) by setting an intense background
color, typically a shade of red. It must be used scarcely."
:group 'elegance)

(defface face-popout nil
"Popout face is used for information that needs attention.
To achieve such effect, the hue of the face has to be
sufficiently different from other faces such that it attracts
attention through the popout effect."
:group 'elegance)

(defface face-strong nil
"Strong face is used for information of a structural nature.
It has to be the same color as the default color and only the
weight differs by one level (e.g., light/regular or
regular/bold). IT is generally used for titles, keywords,
directory, etc."
:group 'elegance)

(defface face-salient nil
"Salient face is used for information that are important.
To suggest the information is of the same nature but important,
the face uses a different hue with approximately the same
intensity as the default face. This is typically used for links."

:group 'elegance)

(defface face-salient-strong nil
"Salient strong face is used for information that are important.
To suggest the information is of the same nature but important,
the face uses a different hue with approximately the same
intensity as the default face. This is typically used for links."

:group 'elegance)

(defface face-faded nil
"Faded face is for information that are less important.
It is made by using the same hue as the default but with a lesser
intensity than the default. It can be used for comments,
secondary information and also replace italic (which is generally
abused anyway)."
:group 'elegance)

(defface face-subtle nil
"Subtle face is used to suggest a physical area on the screen.
It is important to not disturb too strongly the reading of
information and this can be made by setting a very light
background color that is barely perceptible."
:group 'elegance)

(defface face-backlit nil
"Backlit face is used for code blocks."

:group 'elegance)

(defface face-underline-warning nil
"Backlit face is used for code blocks."

:group 'elegance)

(defface face-underline-error nil
"Backlit face is used for code blocks."

:group 'elegance)

;;; -------------------------------------------------------------------


;; Structural
;; -------------------------------------------------------------------
(set-face 'bold                                          'face-strong)
(set-face 'italic                                         'face-faded)
(set-face 'bold-italic                                   'face-strong)
(set-face 'region                                        'face-subtle)
(set-face 'highlight                                     'face-subtle)
(set-face 'fixed-pitch                                       'default)
(set-face 'fixed-pitch-serif                                 'default)
(set-face 'variable-pitch                                    'default)
(set-face 'cursor                                            'default)
;;; -------------------------------------------------------------------


;; Semantic
;;; -------------------------------------------------------------------
(set-face 'shadow                                         'face-faded)
(set-face 'success                                      'face-salient)
(set-face 'warning                                       'face-popout)
(set-face 'error                                       'face-critical)
;;; -------------------------------------------------------------------


;; General
;;; -------------------------------------------------------------------
(set-face 'header-line                                   'face-strong)
(set-face 'mode-line-inactive                            'mode-line)
(set-face-attribute 'mode-line nil                       :height 10
                                                         :overline nil
                                                         :box nil)
(set-face 'buffer-menu-buffer                            'face-strong)
(set-face 'minibuffer-prompt                             'face-strong)
(set-face 'link                                          'face-salient)
(set-face 'fringe                                        'face-faded)
(set-face 'isearch                                       'face-strong)
(set-face 'isearch-fail                                  'face-faded)
(set-face 'lazy-highlight                                'face-subtle)
(set-face 'trailing-whitespace                           'face-subtle)
(set-face 'show-paren-match                              'face-popout)
(set-face 'show-paren-mismatch                           'face-normal)
(set-face-attribute 'tooltip nil                         :height 0.85)
;;; -------------------------------------------------------------------


;; Programmation mode
;;; -------------------------------------------------------------------
(set-face 'font-lock-comment-face                         'face-faded)
(set-face 'font-lock-doc-face                             'face-faded)
(set-face 'font-lock-string-face                         'face-popout)
(set-face 'font-lock-constant-face                      'face-salient)
(set-face 'font-lock-warning-face                        'face-popout)
(set-face 'font-lock-function-name-face                  'face-strong)
(set-face 'font-lock-variable-name-face                  'face-strong)
(set-face 'font-lock-builtin-face                       'face-salient)
(set-face 'font-lock-type-face                          'face-salient)
(set-face 'font-lock-keyword-face                       'face-salient)
;;; -------------------------------------------------------------------


;; Compilation mode
;;; -------------------------------------------------------------------
(with-eval-after-load 'compilation-mode
  (set-face 'compilation-line-number 'face-strong)
  (set-face 'compilation-column-number 'face-strong)
  (set-face 'compilation-error 'face-critical))
(set-face 'elisp-shorthand-font-lock-face 'face-popout)

;;; -------------------------------------------------------------------


;;; Dired
(with-eval-after-load 'dired
  (set-face 'dired-directory                       'face-strong))


;;; Dired subtree

(with-eval-after-load 'dired-subtree
  (let ((background-color (face-background 'default nil 'default)))
    (set-face-attribute 'dired-subtree-depth-1-face nil
                        :background background-color)
    (set-face-attribute 'dired-subtree-depth-2-face nil
                        :background background-color)
    (set-face-attribute 'dired-subtree-depth-3-face nil
                        :background background-color)
    (set-face-attribute 'dired-subtree-depth-4-face nil
                        :background background-color)
    (set-face-attribute 'dired-subtree-depth-5-face nil
                        :background background-color)
    (set-face-attribute 'dired-subtree-depth-6-face nil
                        :background background-color)))


(with-eval-after-load 'hydra
  (set-face 'hydra-face-blue                            'face-salient-strong)
  (set-face 'hydra-face-red                             'face-salient))

;; Documentation
(with-eval-after-load 'info
  (set-face 'info-menu-header                            'face-strong)
  (set-face 'info-header-node                            'face-normal)
  (set-face 'Info-quoted                                  'face-faded)
  (set-face 'info-title-1                                'face-strong)
  (set-face 'info-title-2                                'face-strong)
  (set-face 'info-title-3                                'face-strong)
  (set-face 'info-title-4                               'face-strong))

;; Bookmarks (Removed, does not exist in Emacs 29?)
;; (with-eval-after-load 'bookmark
;;   (set-face 'bookmark-menu-heading                       'face-strong)
;;   (set-face 'bookmark-menu-bookmark                    'face-salient))


;; Message
(with-eval-after-load 'message
  (set-face 'message-cited-text                           'face-faded)
  (set-face 'message-header-cc                               'default)
  (set-face 'message-header-name                         'face-strong)
  (set-face 'message-header-newsgroups                       'default)
  (set-face 'message-header-other                            'default)
  (set-face 'message-header-subject                     'face-salient)
  (set-face 'message-header-to                          'face-salient)
  (set-face 'message-header-xheader                          'default)
  (set-face 'message-mml                                 'face-popout)
  (set-face 'message-separator                           'face-faded))

;; Outline
(with-eval-after-load 'outline
  (set-face 'outline-1                                   'face-strong)
  (set-face 'outline-2                                   'face-strong)
  (set-face 'outline-3                                   'face-strong)
  (set-face 'outline-4                                   'face-strong)
  (set-face 'outline-5                                   'face-strong)
  (set-face 'outline-6                                   'face-strong)
  (set-face 'outline-7                                   'face-strong)
  (set-face 'outline-8                                  'face-strong))

;; Interface
(with-eval-after-load 'cus-edit
  (set-face 'widget-field                                'face-subtle)
  (set-face 'widget-button                               'face-strong)
  (set-face 'widget-single-line-field                    'face-subtle)
  (set-face 'custom-group-subtitle                       'face-strong)
  (set-face 'custom-group-tag                            'face-strong)
  (set-face 'custom-group-tag-1                          'face-strong)
  (set-face 'custom-comment                               'face-faded)
  (set-face 'custom-comment-tag                           'face-faded)
  (set-face 'custom-changed                             'face-salient)
  (set-face 'custom-modified                            'face-salient)
  (set-face 'custom-face-tag                             'face-strong)
  (set-face 'custom-variable-tag                             'default)
  (set-face 'custom-invalid                              'face-popout)
  (set-face 'custom-visibility                          'face-salient)
  (set-face 'custom-state                               'face-salient)
  (set-face 'custom-link                               'face-salient))

;; Package
(with-eval-after-load 'package
  (set-face 'package-description                             'default)
  (set-face 'package-help-section-name                       'default)
  (set-face 'package-name                               'face-salient)
  (set-face 'package-status-avail-obso                    'face-faded)
  (set-face 'package-status-available                        'default)
  (set-face 'package-status-built-in                    'face-salient)
  (set-face 'package-status-dependency                  'face-salient)
  (set-face 'package-status-disabled                      'face-faded)
  (set-face 'package-status-external                         'default)
  (set-face 'package-status-held                             'default)
  (set-face 'package-status-incompat                      'face-faded)
  (set-face 'package-status-installed                   'face-salient)
  (set-face 'package-status-new                              'default)
  (set-face 'package-status-unsigned                         'default))

;; Buttons
;;; -------------------------------------------------------------------
(defun elegant-buttons ()
  "Derive button faces from nano faces."
  ;; Buttons
  (with-eval-after-load 'cus-edit
    (set-face-attribute 'custom-button nil
                         :foreground (face-foreground 'default)
                         :background (face-background 'face-subtle)
                         :box `(:line-width 2
                                :color ,(face-foreground 'face-faded)
                                :style nil))
    (set-face-attribute 'custom-button-mouse nil
                         ;;                      :inherit 'custom-button
                         :foreground (face-foreground 'face-faded)
                         :background (face-background 'face-subtle)
                         :box `(:line-width 1
                                            :color ,(face-foreground 'default)
                                            :style nil))
    (set-face-attribute 'custom-button-pressed nil
                         :foreground (face-background 'default)
                         :background (face-foreground 'face-salient)
                         :inherit 'face-salient
                         :box `(:line-width 1
                                            :color ,(face-foreground 'face-salient)
                                            :style nil)
                         :inverse-video nil)))
;;; -------------------------------------------------------------------


;; Flyspell
(with-eval-after-load 'flyspell
  (set-face 'flyspell-duplicate                         'face-underline-warning)
  (set-face 'flyspell-incorrect                         'face-underline-error))

;; Ido
(with-eval-after-load 'ido
  (set-face 'ido-first-match                            'face-salient)
  (set-face 'ido-only-match                               'face-faded)
  (set-face 'ido-subdir                                 'face-strong))

;; Diff
(with-eval-after-load 'diff-mode
  (set-face 'diff-header                                  'face-faded)
  (set-face 'diff-file-header                            'face-strong)
  (set-face 'diff-context                                    'default)
  (set-face 'diff-removed                                 'face-faded)
  (set-face 'diff-changed                                'face-popout)
  (set-face 'diff-added                                 'face-salient)
  (set-face 'diff-refine-added            '(face-salient face-strong))
  (set-face 'diff-refine-changed                         'face-popout)
  (set-face 'diff-refine-removed                          'face-faded)
  (set-face-attribute     'diff-refine-removed nil :strike-through t))



;; Term
;;; -------------------------------------------------------------------
'(term-bold                                   'face-strong)
'(set-face-attribute 'term-color-black nil
         :foreground (face-foreground 'default)
         :background (face-foreground 'default))
'(set-face-attribute 'term-color-white nil
         :foreground "white" :background "white")
'(set-face-attribute 'term-color-blue nil
         :foreground "#42A5F5" :background "#BBDEFB")
'(set-face-attribute 'term-color-cyan nil
         :foreground "#26C6DA" :background "#B2EBF2")
'(set-face-attribute 'term-color-green nil
         :foreground "#66BB6A" :background "#C8E6C9")
'(set-face-attribute 'term-color-magenta nil
         :foreground "#AB47BC" :background "#E1BEE7")
'(set-face-attribute 'term-color-red nil
         :foreground "#EF5350" :background "#FFCDD2")
'(set-face-attribute 'term-color-yellow nil
         :foreground "#FFEE58" :background "#FFF9C4")
;;; -------------------------------------------------------------------


;; org-agendas
;;; -------------------------------------------------------------------
(with-eval-after-load 'org-agenda
  (set-face 'org-agenda-calendar-event                    'default)
  (set-face 'org-agenda-calendar-sexp                     'face-faded)
  (set-face 'org-agenda-clocking                          'face-faded)
  (set-face 'org-agenda-column-dateline                   'face-faded)
  (set-face 'org-agenda-current-time                      'face-faded)
  (set-face 'org-agenda-date                            'face-salient)
  (set-face 'org-agenda-date-today        '(face-salient face-strong))
  (set-face 'org-agenda-date-weekend                      'face-faded)
  (set-face 'org-agenda-diary                             'face-faded)
  (set-face 'org-agenda-dimmed-todo-face                  'face-faded)
  (set-face 'org-agenda-done                              'face-faded)
  (set-face 'org-agenda-filter-category                   'face-faded)
  (set-face 'org-agenda-filter-effort                     'face-faded)
  (set-face 'org-agenda-filter-regexp                     'face-faded)
  (set-face 'org-agenda-filter-tags                       'face-faded)
  (set-face 'org-agenda-restriction-lock                  'face-faded)
  (set-face 'org-agenda-structure                        'face-faded))
;;; -------------------------------------------------------------------


  ;; org mode
;;; -------------------------------------------------------------------
(with-eval-after-load 'org
  (set-face 'org-archived                                 'face-faded)
  (set-face 'org-block                                    'face-faded)
  (set-face 'org-block-begin-line                         'face-faded)
  (set-face 'org-block-end-line                           'face-faded)
  (set-face 'org-checkbox                                 'face-faded)
  (set-face 'org-checkbox-statistics-done                 'face-faded)
  (set-face 'org-checkbox-statistics-todo                 'face-faded)
  (set-face 'org-clock-overlay                            'face-faded)
  (set-face 'org-code                                     'face-faded)
  (set-face 'org-column                                   'face-faded)
  (set-face 'org-column-title                             'face-faded)
  (set-face 'org-date                                   'face-salient)
  (set-face 'org-date-selected                            'face-faded)
  (set-face 'org-default                                  'face-faded)
  (set-face 'org-document-info                            'face-faded)
  (set-face 'org-document-info-keyword                    'face-faded)
  (set-face 'org-document-title                           'face-faded)
  (set-face 'org-done                                        'default)
  (set-face 'org-drawer                                   'face-faded)
  (set-face 'org-ellipsis                                 'face-faded)
  (set-face 'org-footnote                                 'face-faded)
  (set-face 'org-formula                                  'face-faded)
  (set-face 'org-headline-done                            'face-faded)
  (set-face 'org-latex-and-related                        'face-faded)
  (set-face 'org-level-1                                 'face-strong)
  (set-face 'org-level-2                                 'face-strong)
  (set-face 'org-level-3                                 'face-strong)
  (set-face 'org-level-4                                 'face-strong)
  (set-face 'org-level-5                                 'face-strong)
  (set-face 'org-level-6                                 'face-strong)
  (set-face 'org-level-7                                 'face-strong)
  (set-face 'org-level-8                                 'face-strong)
  (set-face 'org-link                                   'face-salient)
  (set-face 'org-list-dt                                 'face-strong)
  (set-face 'org-macro                                    'face-faded)
  (set-face 'org-meta-line                                'face-faded)
  (set-face 'org-mode-line-clock                          'face-faded)
  (set-face 'org-mode-line-clock-overrun                  'face-faded)
  (set-face 'org-priority                                 'face-faded)
  (set-face 'org-property-value                           'face-faded)
  (set-face 'org-quote                                    'face-faded)
  (set-face 'org-scheduled                                'face-faded)
  (set-face 'org-scheduled-previously                     'face-faded)
  (set-face 'org-scheduled-today                          'face-faded)
  (set-face 'org-sexp-date                                'face-faded)
  (set-face 'org-special-keyword                          'face-faded)
  (set-face 'org-table                                  'face-salient)
  (set-face 'org-tag                                      'face-faded)
  (set-face 'org-tag-group                                'face-faded)
  (set-face 'org-target                                   'face-faded)
  (set-face 'org-time-grid                                'face-faded)
  (set-face 'org-todo                                  'face-critical)
  (set-face 'org-upcoming-deadline                        'face-faded)
  (set-face 'org-verbatim                               'face-backlit)
  (set-face 'org-verse                                    'face-faded)
  (set-face 'org-warning                                 'face-popout))

 (setq org-hide-emphasis-markers t)

;;; -------------------------------------------------------------------


;; Mu4e
;;; -------------------------------------------------------------------
(with-eval-after-load 'mu4e
  (set-face 'mu4e-attach-number-face                     'face-strong)
  (set-face 'mu4e-cited-1-face                            'face-faded)
  (set-face 'mu4e-cited-2-face                            'face-faded)
  (set-face 'mu4e-cited-3-face                            'face-faded)
  (set-face 'mu4e-cited-4-face                            'face-faded)
  (set-face 'mu4e-cited-5-face                            'face-faded)
  (set-face 'mu4e-cited-6-face                            'face-faded)
  (set-face 'mu4e-cited-7-face                            'face-faded)
  (set-face 'mu4e-compose-header-face                     'face-faded)
  (set-face 'mu4e-compose-separator-face                  'face-faded)
  (set-face 'mu4e-contact-face                          'face-salient)
  (set-face 'mu4e-context-face                            'face-faded)
  (set-face 'mu4e-draft-face                              'face-faded)
  (set-face 'mu4e-flagged-face                            'face-faded)
  (set-face 'mu4e-footer-face                             'face-faded)
  (set-face 'mu4e-forwarded-face                          'face-faded)
  (set-face 'mu4e-header-face                                'default)
  (set-face 'mu4e-header-highlight-face                  'face-subtle)
  (set-face 'mu4e-header-key-face                        'face-strong)
  (set-face 'mu4e-header-marks-face                       'face-faded)
  (set-face 'mu4e-header-title-face                      'face-strong)
  (set-face 'mu4e-header-value-face                          'default)
  (set-face 'mu4e-highlight-face                         'face-popout)
  (set-face 'mu4e-link-face                             'face-salient)
  (set-face 'mu4e-modeline-face                           'face-faded)
  (set-face 'mu4e-moved-face                              'face-faded)
  (set-face 'mu4e-ok-face                                 'face-faded)
  (set-face 'mu4e-region-code                             'face-faded)
  (set-face 'mu4e-replied-face                          'face-salient)
  (set-face 'mu4e-special-header-value-face                  'default)
  (set-face 'mu4e-system-face                             'face-faded)
  (set-face 'mu4e-title-face                             'face-strong)
  (set-face 'mu4e-trashed-face                            'face-faded)
  (set-face 'mu4e-unread-face                            'face-strong)
  (set-face 'mu4e-url-number-face                         'face-faded)
  (set-face 'mu4e-view-body-face                             'default)
  (set-face 'mu4e-warning-face                            'face-faded))
;;; -------------------------------------------------------------------

;;; Vue-mode requires this change to be readable
(with-eval-after-load 'mmm-mode
  (set-face-background 'mmm-default-submode-face         'unspecified))


;;;;###autoload
;;; -------------------------------------------------------------------
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))
;;; -------------------------------------------------------------------


;;; Provide commons for the elegant-emacs-themes
;;; -------------------------------------------------------------------
(provide 'elegant)
;;; -------------------------------------------------------------------

;;; elegant.el ends here
