
{ buildLispPackage, stdenv, fetchurl, lisp-project_optima, 
   lisp_alexandria, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "optima";
      
      sourceProject = "${lisp-project_optima}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_optima-20150709-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
