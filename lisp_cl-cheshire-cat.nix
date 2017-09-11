
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-cheshire-cat, 
   lisp_alexandria, lisp_cl-fad, lisp_cl-ppcre, lisp_cl-store, lisp_hunchentoot, lisp_split-sequence, lisp_usocket,  
  clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-fad lisp_cl-ppcre lisp_cl-store lisp_hunchentoot lisp_split-sequence lisp_usocket  ];
      inherit stdenv;
      systemName = "cl-cheshire-cat";
      
      sourceProject = "${lisp-project_cl-cheshire-cat}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-fad} ${lisp_cl-ppcre} ${lisp_cl-store} ${lisp_hunchentoot} ${lisp_split-sequence} ${lisp_usocket}";
      name = "lisp_cl-cheshire-cat-20121125-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
