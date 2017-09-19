
{ buildLispPackage, stdenv, fetchurl, lisp-project_defmemo, 
   lisp_trivial-garbage, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_alexandria  ];
      inherit stdenv;
      systemName = "defmemo";
      
      sourceProject = "${lisp-project_defmemo}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_alexandria}";
      name = "lisp_defmemo-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
