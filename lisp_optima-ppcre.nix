
{ buildLispPackage, stdenv, fetchurl, lisp-project_optima, 
   lisp_cl-ppcre, lisp_closer-mop, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "optima.ppcre";
      
      sourceProject = "${lisp-project_optima}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_optima-ppcre-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
