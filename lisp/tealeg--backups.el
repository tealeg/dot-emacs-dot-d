;;; tealeg--backups.el -- backup file configuration
;;;
;;; Commentary:
;;;	Emacs has the ability to create automatic backups of files
;;;	you're editing.  This is a useful feature, but the default set
;;;	up litters your working directory with those backups.  I keep
;;;	mine in a hidden folder in my $HOME called ".saves".
;;;
;;; Code:

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
   '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)

(provide 'tealeg--backups)
;;; tealeg--backups.el ends here
