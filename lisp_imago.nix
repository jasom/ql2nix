
{ buildLispPackage, stdenv, fetchurl, lisp-project_imago, 
   lisp_zlib,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_zlib  ];
      inherit stdenv;
      systemName = "imago";
      
      sourceProject = "${lisp-project_imago}";
      patches = [];
      lisp_dependencies = "${lisp_zlib}";
      name = "lisp_imago-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
