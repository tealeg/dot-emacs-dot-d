(require 'org)

(setq org-todo-keywords
      '((sequence "TODO" "PLANNED(@/@)" "IN PROGRESS(@/@)"
		  "|" "DONE(@)" "DELEGATED(@)" "CANCELLED(@)")
	(type "IDEA")))


(provide 'tealeg--org)
