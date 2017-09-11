
{ buildLispPackage, stdenv, fetchurl, lisp-project_with-setf, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "with-setf";
      
      sourceProject = "${lisp-project_with-setf}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_with-setf-release-quicklisp-29deacde-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
