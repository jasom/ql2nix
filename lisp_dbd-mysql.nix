
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_cl-mysql, lisp_bordeaux-threads, lisp_closer-mop, lisp_split-sequence, lisp_cl-syntax-annot, lisp_cl-syntax,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mysql lisp_bordeaux-threads lisp_closer-mop lisp_split-sequence lisp_cl-syntax-annot lisp_cl-syntax  ];
      inherit stdenv;
      systemName = "dbd-mysql";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mysql} ${lisp_bordeaux-threads} ${lisp_closer-mop} ${lisp_split-sequence} ${lisp_cl-syntax-annot} ${lisp_cl-syntax}";
      name = "lisp_dbd-mysql-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
