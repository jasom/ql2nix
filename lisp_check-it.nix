
{ buildLispPackage, stdenv, fetchurl, lisp-project_check-it, 
   lisp_alexandria, lisp_closer-mop, lisp_optima,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop lisp_optima  ];
      inherit stdenv;
      systemName = "check-it";
      
      sourceProject = "${lisp-project_check-it}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop} ${lisp_optima}";
      name = "lisp_check-it-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
