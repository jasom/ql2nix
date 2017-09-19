
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-string-template, 
   lisp_cl-ppcre, lisp_closer-mop, lisp_proc-parse, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_closer-mop lisp_proc-parse lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivial-string-template";
      
      sourceProject = "${lisp-project_trivial-string-template}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_proc-parse} ${lisp_alexandria}";
      name = "lisp_trivial-string-template-20161031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
