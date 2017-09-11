
{ buildLispPackage, stdenv, fetchurl, lisp-project_hunchensocket, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_chunga, lisp_cl-fad, lisp_flexi-streams, lisp_hunchentoot, lisp_ironclad, lisp_trivial-backtrace, lisp_trivial-utf-8,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_chunga lisp_cl-fad lisp_flexi-streams lisp_hunchentoot lisp_ironclad lisp_trivial-backtrace lisp_trivial-utf-8  ];
      inherit stdenv;
      systemName = "hunchensocket";
      
      sourceProject = "${lisp-project_hunchensocket}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_chunga} ${lisp_cl-fad} ${lisp_flexi-streams} ${lisp_hunchentoot} ${lisp_ironclad} ${lisp_trivial-backtrace} ${lisp_trivial-utf-8}";
      name = "lisp_hunchensocket-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
