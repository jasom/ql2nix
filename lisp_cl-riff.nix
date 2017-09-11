
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-riff, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-riff";
      
      sourceProject = "${lisp-project_cl-riff}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_cl-riff-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
