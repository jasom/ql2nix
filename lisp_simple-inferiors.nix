
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-inferiors, 
   lisp_bordeaux-threads, lisp_external-program,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_bordeaux-threads lisp_external-program  ];
      inherit stdenv;
      systemName = "simple-inferiors";
      
      sourceProject = "${lisp-project_simple-inferiors}";
      patches = [];
      lisp_dependencies = "${lisp_bordeaux-threads} ${lisp_external-program}";
      name = "lisp_simple-inferiors-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
