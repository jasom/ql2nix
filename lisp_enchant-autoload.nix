
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-enchant, 
  enchant,   lisp_cffi,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi enchant ];
      inherit stdenv;
      systemName = "enchant-autoload";
      
      sourceProject = "${lisp-project_cl-enchant}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_enchant-autoload-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
