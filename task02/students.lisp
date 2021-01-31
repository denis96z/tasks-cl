(defvar *students* nil)

(defun add-student (student)
  (push student *students*))

(defun make-student (first-name last-name age)
  (list :first-name first-name :last-name last-name :age age))

(defun print-students ()
  (dolist (student *students*)
    (write-line (write-to-string student))))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*) (read-line *query-io*))

(defun prompt-read-student ()
  (make-student
    (prompt-read "First Name") (prompt-read "Last Name")
    (parse-integer (prompt-read "Age") :junk-allowed t)))

(defun read-students ()
  (loop (add-student (prompt-read-student))
    (if (not (y-or-n-p "Another? [y/n]: ")) (return))))
