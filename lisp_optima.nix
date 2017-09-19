
{ buildLispPackage, stdenv, fetchurl, lisp-project_optima, 
   lisp_closer-mop, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "optima";
      
      sourceProject = "${lisp-project_optima}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_optima-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
