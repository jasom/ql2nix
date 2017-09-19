
{ buildLispPackage, stdenv, fetchurl, lisp-project_fset, 
   lisp_mt19937, lisp_misc-extensions,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mt19937 lisp_misc-extensions  ];
      inherit stdenv;
      systemName = "fset";
      
      sourceProject = "${lisp-project_fset}";
      patches = [];
      lisp_dependencies = "${lisp_mt19937} ${lisp_misc-extensions}";
      name = "lisp_fset-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
