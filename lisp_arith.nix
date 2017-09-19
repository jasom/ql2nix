
{ buildLispPackage, stdenv, fetchurl, lisp-project_paren-test, 
   lisp_trivial-shell, lisp_paren-files,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-shell lisp_paren-files  ];
      inherit stdenv;
      systemName = "arith";
      
      sourceProject = "${lisp-project_paren-test}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-shell} ${lisp_paren-files}";
      name = "lisp_arith-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
