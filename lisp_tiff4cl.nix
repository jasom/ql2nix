
{ buildLispPackage, stdenv, fetchurl, lisp-project_tiff4cl, 
   lisp_ie3fp,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ie3fp  ];
      inherit stdenv;
      systemName = "tiff4cl";
      
      sourceProject = "${lisp-project_tiff4cl}";
      patches = [];
      lisp_dependencies = "${lisp_ie3fp}";
      name = "lisp_tiff4cl-20150804-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
