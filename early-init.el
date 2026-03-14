;;; early-init.el --- Runs before the first frame is drawn  -*- lexical-binding: t; -*-
;;
;; Part of Sheeshmacs
;;
;; Settings here take effect before the GUI frame is created,
;; avoiding visible resizing/flickering on startup.

;; Disable UI chrome before the frame is drawn
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set the font before the frame is created so the theme enabling
;; it later doesn't cause a resize (both elegant-light and
;; elegant-dark use Roboto Mono).
(set-face-attribute 'default nil :family "Roboto Mono")

;; Frame defaults applied to the initial (and all future) frames
(setq default-frame-alist
      (append default-frame-alist
              '((internal-border-width . 24)
                (vertical-scroll-bars  . nil))))

;;; early-init.el ends here
