
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-finalizers, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "asdf-finalizers";
      
      sourceProject = "${lisp-project_asdf-finalizers}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_asdf-finalizers-20170403-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
