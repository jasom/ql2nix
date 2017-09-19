
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump-sexp, 
   lisp_plump,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump  ];
      inherit stdenv;
      systemName = "plump-sexp";
      
      sourceProject = "${lisp-project_plump-sexp}";
      patches = [];
      lisp_dependencies = "${lisp_plump}";
      name = "lisp_plump-sexp-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
