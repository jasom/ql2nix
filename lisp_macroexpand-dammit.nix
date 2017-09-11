
{ buildLispPackage, stdenv, fetchurl, lisp-project_macroexpand-dammit, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "macroexpand-dammit";
      
      sourceProject = "${lisp-project_macroexpand-dammit}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_macroexpand-dammit-20131111-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
