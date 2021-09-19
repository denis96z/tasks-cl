(load
  (merge-pathnames
    ".sbclrc"
    (user-homedir-pathname)))

(ql:quickload 'md5)

(format t "~{~(~x~)~}"
  (coerce
    (md5:md5sum-string
      (read-line))
    'list))
