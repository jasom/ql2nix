
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-wordcut, 
   lisp_cl-wordcut, lisp_fiveam,  
  sbcl, clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-wordcut lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-wordcut/test";
      
      sourceProject = "${lisp-project_cl-wordcut}";
      patches = [];
      lisp_dependencies = "${lisp_cl-wordcut} ${lisp_fiveam}";
      name = "lisp_cl-wordcut-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" ];
    }
