;;; tealeg-lxd-test --- Unit tests for tealeg-lxd.
;;;
;;; Commentary:
;;;
;;;    This file contains emacs regression tests for tealeg-lxd.
;;;
;;; Code:

(require 'tealeg-lxd)
(require 'ert)

(ert-deftest test-tealeg-table-to-alist ()
	"Test the convertion of tabular data to a alist."
	(let* ((alists (tealeg-table-to-alist "| NAME | STATE |\n| foo | bar |\n"))
								 (row1 (car alists)))
						(should (string= "foo" (alist-get :NAME row1)))
						(should (string= "bar" (alist-get :STATE row1)))))

(ert-deftest test-tealeg-table-to-alist-multirow ()
	"Test the convertion of tabular data to a alist."
	(let* ((alists (tealeg-table-to-alist "| NAME | STATE |\n| foo | bar |\n | baz | quux |\n"))
				 (row1 (car alists))
				 (row2 (cadr alists)))
		(should (string= "foo" (alist-get :NAME  row1)))
		(should (string= "bar" (alist-get :STATE  row1)))
		(should (string= "baz" (alist-get :NAME row2)))
		(should (string= "quux" (alist-get :STATE row2)))))

(ert-deftest test-tealeg-table-to-alist-omits-seperators ()
	"Test that horizontal seperators and borders of the tabular format are omittied from the resulting data structure."
	(let* ((alists (tealeg-table-to-alist "+--------+---------+\n|  NAME  |  STATE  |\n| foo    | bar     |\n"))
				 (row1 (car alists)))
		(should (equal 2 (length row1)))))


(ert-deftest test-tealeg--lines-to-list ()
	"Splits table lines into a list of lines."
	(let* ((data "
+-------+---------+------+------+-----------+
| NAME  |  STATE  | IPV4 | IPV6 | EPHEMERAL |
+-------+---------+------+------+-----------+
| go1.5 | STOPPED |      |      | NO        |
| test  | STOPPED |      |      | NO        |
| l2    | STOPPED |      |      | NO        |
| tt    | STOPPED |      |      | NO        |
+-------+---------+------+------+-----------+
")
				 (lines (tealeg--lines-to-list data)))
		(should (equal 8 (length lines)))
		(should (equal
						 '("+-------+---------+------+------+-----------+"
							 "| NAME  |  STATE  | IPV4 | IPV6 | EPHEMERAL |"
							 "+-------+---------+------+------+-----------+"
							 "| go1.5 | STOPPED |      |      | NO        |"
							 "| test  | STOPPED |      |      | NO        |"
							 "| l2    | STOPPED |      |      | NO        |"
							 "| tt    | STOPPED |      |      | NO        |"
							 "+-------+---------+------+------+-----------+")
						 lines))))

(ert-deftest test-tealeg--filter-horizonal-separators ()
	"We can filter the horizontal separators, which convey no information, from the table data."
  (let ((result (tealeg--filter-horizontal-separators
						 '("+-------+---------+------+------+-----------+"
							 "| NAME  |  STATE  | IPV4 | IPV6 | EPHEMERAL |"
							 "+-------+---------+------+------+-----------+"
							 "| go1.5 | STOPPED |      |      | NO        |"
							 "| test  | STOPPED |      |      | NO        |"
							 "| l2    | STOPPED |      |      | NO        |"
							 "| tt    | STOPPED |      |      | NO        |"
							 "+-------+---------+------+------+-----------+"))))
		(should (equal 5 (length result)))
		(should (equal
						 '("| NAME  |  STATE  | IPV4 | IPV6 | EPHEMERAL |"
							 "| go1.5 | STOPPED |      |      | NO        |"
							 "| test  | STOPPED |      |      | NO        |"
							 "| l2    | STOPPED |      |      | NO        |"
							 "| tt    | STOPPED |      |      | NO        |")
						 result))))

(ert-deftest test-tealeg--separator-trim-right ()
	"We can trim the trailer separator from a line."
	(let ((result (tealeg--separator-trim-right "| foo | bar |")))
		(should (equal "| foo | bar " result))))

(ert-deftest test-tealeg--separator-trim-left ()
	"We can trim the trailer separator from a line."
	(let ((result (tealeg--separator-trim-left "| foo | bar |")))
		(should (equal " foo | bar |" result))))

(ert-deftest test-tealeg--split-line-into-fields ()
	"We can split a line from a table and turn it into a list of values."
	(let ((result (tealeg--split-line-into-fields
								 "| test  | STOPPED |      |      | NO        |")))
		(should (equal 5 (length result)))
		(should (equal '("test" "STOPPED" "" "" "NO") result))))

;;; tealeg-lxd-test.el ends here
