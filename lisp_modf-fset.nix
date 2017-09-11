
{ buildLispPackage, stdenv, fetchurl, lisp-project_modf-fset, 
   lisp_fset, lisp_modf,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fset lisp_modf  ];
      inherit stdenv;
      systemName = "modf-fset";
      
      sourceProject = "${lisp-project_modf-fset}";
      patches = [];
      lisp_dependencies = "${lisp_fset} ${lisp_modf}";
      name = "lisp_modf-fset-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
