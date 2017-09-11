
{ buildLispPackage, stdenv, fetchurl, lisp-project_infix-math, 
   lisp_asdf-package-system, lisp_alexandria, lisp_serapeum, lisp_wu-decimal,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system lisp_alexandria lisp_serapeum lisp_wu-decimal  ];
      inherit stdenv;
      systemName = "infix-math";
      
      sourceProject = "${lisp-project_infix-math}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system} ${lisp_alexandria} ${lisp_serapeum} ${lisp_wu-decimal}";
      name = "lisp_infix-math-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
