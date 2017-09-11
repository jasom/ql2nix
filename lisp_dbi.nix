
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-dbi, 
   lisp_bordeaux-threads, lisp_cl-syntax, lisp_cl-syntax-annot, lisp_closer-mop, lisp_split-sequence,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_cl-syntax lisp_cl-syntax-annot lisp_closer-mop lisp_split-sequence  ];
      inherit stdenv;
      systemName = "dbi";
      
      sourceProject = "${lisp-project_cl-dbi}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_cl-syntax} ${lisp_cl-syntax-annot} ${lisp_closer-mop} ${lisp_split-sequence}";
      name = "lisp_dbi-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
