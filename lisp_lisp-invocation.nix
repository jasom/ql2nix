
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-invocation, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "lisp-invocation";
      
      sourceProject = "${lisp-project_lisp-invocation}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_lisp-invocation-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
