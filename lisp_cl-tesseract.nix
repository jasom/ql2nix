
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-tesseract, 
  tesseract,   lisp_cffi,  
  clisp,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi tesseract ];
      inherit stdenv;
      systemName = "cl-tesseract";
      
      sourceProject = "${lisp-project_cl-tesseract}";
      patches = [];
      lisp_dependencies = "${lisp_cffi}";
      name = "lisp_cl-tesseract-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.clisp}" ];
    }
