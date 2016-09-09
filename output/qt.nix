
{ buildLispPackage, stdenv, fetchurl, sbcl, asdf, kde4, lisp-alexandria, lisp-cffi, lisp-cl-ppcre, lisp-closer-mop, lisp-iterate, lisp-named-readtables, lisp-trivial-features, lisp-trivial-garbage, system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ sbcl asdf lisp-alexandria lisp-cffi lisp-cl-ppcre lisp-closer-mop lisp-iterate lisp-named-readtables lisp-trivial-features lisp-trivial-garbage kde4.qt4 kde4.smokeqt ];
      inherit stdenv;
      lisp_name = "sbcl-qt";
      LD_LIBRARY_PATH = "${kde4.qt4}/lib:${kde4.smokeqt}/lib";
      systemName = "qt";
      lisp_dependencies = "${lisp-alexandria} ${lisp-cffi} ${lisp-cl-ppcre} ${lisp-closer-mop} ${lisp-iterate} ${lisp-named-readtables} ${lisp-trivial-features} ${lisp-trivial-garbage}";
      name = "qt-20160421-git";
      asdf="${pkgs.asdf}";
      lisp = "${pkgs.sbcl}/bin/sbcl --no-sysinit --no-userinit";
      src = pkgs.fetchurl {
        url = "http://beta.quicklisp.org/archive/commonqt/2016-04-21/commonqt-20160421-git.tgz";
        md5 = "fb8949f4931a02062f4e3bbaa8dd2066";
      };
    }
