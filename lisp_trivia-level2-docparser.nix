
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivia, 
   lisp_docparser, lisp_closer-mop, lisp_lisp-namespace, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_docparser lisp_closer-mop lisp_lisp-namespace lisp_alexandria  ];
      inherit stdenv;
      systemName = "trivia.level2.docparser";
      
      sourceProject = "${lisp-project_trivia}";
      patches = [];
      lisp_dependencies = "${lisp_docparser} ${lisp_closer-mop} ${lisp_lisp-namespace} ${lisp_alexandria}";
      name = "lisp_trivia-level2-docparser-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
