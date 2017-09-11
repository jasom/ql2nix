
{ buildLispPackage, stdenv, fetchurl, lisp-project_define-json-expander, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "define-json-expander";
      
      sourceProject = "${lisp-project_define-json-expander}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_define-json-expander-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
