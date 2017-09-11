
{ buildLispPackage, stdenv, fetchurl, lisp-project_method-versions, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "method-versions";
      
      sourceProject = "${lisp-project_method-versions}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_method-versions_0.1.2011.05.18";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
