
{ buildLispPackage, stdenv, fetchurl, lisp-project_fset, 
   lisp_misc-extensions, lisp_mt19937,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_misc-extensions lisp_mt19937  ];
      inherit stdenv;
      systemName = "fset";
      
      sourceProject = "${lisp-project_fset}";
      patches = [];
      lisp_dependencies = "${lisp_misc-extensions} ${lisp_mt19937}";
      name = "lisp_fset-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
