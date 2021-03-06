(asdf:defsystem #:elprep
  :version "2.61"
  :author "Charlotte Herzeel, Pascal Costanza"
  :licence
  "Copyright (c) 2014, 2015, 2016 Imec and Intel Corporation.
Copyright (c) 2017 Imec.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
* Neither the name of Imec or Intel Corporation nor the names of its
 contributors may be used to endorse or promote products derived from
 this software without specific prior written permission."
  :components ((:file "elprep-package")
               (:file "lisp-utils" :depends-on ("elprep-package"))
               (:file "io-utils" :depends-on ("lisp-utils"))
               (:file "buffer" :depends-on ("lisp-utils" "io-utils"))
               (:file "sam-types" :depends-on ("lisp-utils"))
               (:file "sam-files" :depends-on ("io-utils" "sam-types"))
	       (:file "simple-trees" :depends-on ("lisp-utils"))
               (:file "filter-pipeline" :depends-on ("sam-files" "simple-trees"))
               (:file "simple-filters" :depends-on ("filter-pipeline"))
               (:file "clean-sam" :depends-on ("filter-pipeline"))
               (:file "mark-duplicates" :depends-on ("filter-pipeline"))
               (:file "elprep-utils" :depends-on ("filter-pipeline" "buffer"))
               (:file "user-interface" :depends-on ("filter-pipeline" "mark-duplicates" "clean-sam" "simple-filters" "elprep-utils")))
  :depends-on ("cl-date-time-parser"
               "cl-fad"
               "claws"
               #+sbcl "named-readtables"
               "string-case"
               #+sbcl (:require :sb-concurrency)))
