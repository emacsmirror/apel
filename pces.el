;;; pces.el --- Portable Character Encoding Scheme (coding-system) features

;; Copyright (C) 1998,1999 Free Software Foundation, Inc.

;; Author: MORIOKA Tomohiko <tomo@m17n.org>
;; Keywords: coding-system, emulation, compatibility, Mule

;; This file is part of APEL (A Portable Emacs Library).

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'poe)

(eval-and-compile
  (unless (fboundp 'open-network-stream)
    (require 'tcp)))

(cond ((featurep 'xemacs)
       (if (featurep 'file-coding)
	   (require 'pces-xfc)
	 (require 'pces-raw)
	 ))
      ((featurep 'mule)
       (if (>= emacs-major-version 20)
	   (require 'pces-e20)
	 ;; for MULE 1.* and 2.*
	 (require 'pces-om)
	 ))
      ((boundp 'NEMACS)
       ;; for Nemacs and Nepoch
       (require 'pces-nemacs)
       )
      (t
       (require 'pces-raw)
       ))

	 
;;; @ end
;;;

(provide 'pces)

;;; pces.el ends here
