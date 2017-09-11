
{ buildLispPackage, stdenv, fetchurl, lisp-project_ugly-tiny-infix-macro, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "ugly-tiny-infix-macro";
      
      sourceProject = "${lisp-project_ugly-tiny-infix-macro}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_ugly-tiny-infix-macro-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
