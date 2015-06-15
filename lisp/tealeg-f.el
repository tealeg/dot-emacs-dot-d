
(ert-deftest test-tealeg-zip ()
	"tealeg-zip zips!"
	(should (equal '(("A" . 1) ("B" . 2)) (tealeg-zip '("A" "B") '(1 2)))))
