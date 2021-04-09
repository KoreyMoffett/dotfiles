;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Korey Moffett"
      user-mail-address "kaosfang@tutanota.com")

(if (eq initial-window-system 'x)
    (toggle-frame-maximized)
  (toggle-frame-fullscreen))

(setq doom-font (font-spec :family "mononoki Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Liberation" :size 16))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq global-prettify-symbols-mode t)

(setq doom-theme 'doom-one)

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(setq-default evil-escape-key-sequence "ii")
(setq-default evil-escape-delay 0.2)

(map! :leader
      (:prefix ("s" . "ispell")
       :desc "Spell check word" "s" 'ispell-word
       :desc "Spell check document" "d" 'ispell))

(map! :leader
      (:prefix ("m" . "matodon-toot")
       :desc "Mastodon Toot" "m" 'mastodon-toot))

(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)
(add-hook 'elfeed-show-mode-hook 'visual-line-mode)

(setq elfeed-feeds (quote
                    (("https://koreymoffett.com/rss.xml" Blog)
                     ("https://lineageos.org/feed.xml" LineageOS Android)
                     ("https://lukesmith.xyz/rss.xml" Blog)
                     ("https://www.jeolchrono12.ml/feed.xml" Blog)
                     ("https://reaper.im/blog.xml" Blog)
                     ("https://news.itsfoss.com/feed/" FOSS Linux)
                     ("https://static.fsf.org/fsforg/rss/blogs.xml" Blog FOSS)
                     ("https://static.fsf.org/fsforg/rss/news.xml" News FOSS))))

(after! mastodon
  (setq mastodon-instance-url "https://fosstodon.org"))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda  () (org-bullets-mode 1))))

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))
