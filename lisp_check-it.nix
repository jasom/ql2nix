
{ buildLispPackage, stdenv, fetchurl, lisp-project_check-it, 
   lisp_optima, lisp_closer-mop, lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_optima lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "check-it";
      
      sourceProject = "${lisp-project_check-it}";
      patches = [];
      lisp_dependencies = "${lisp_optima} ${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_check-it-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
