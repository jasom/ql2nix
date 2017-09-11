
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-string-complete, 
   
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [   ];
      inherit stdenv;
      systemName = "cl-string-complete";
      
      sourceProject = "${lisp-project_cl-string-complete}";
      patches = [];
      lisp_dependencies = "";
      name = "lisp_cl-string-complete-20120107-hg";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
