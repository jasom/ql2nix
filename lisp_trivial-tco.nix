
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-tco, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "trivial-tco";
      
      sourceProject = "${lisp-project_trivial-tco}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_trivial-tco-20131003-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
