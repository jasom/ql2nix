
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-extract, 
   lisp_alexandria, lisp_archive, lisp_cl-fad, lisp_deflate, lisp_which, lisp_zip,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_archive lisp_cl-fad lisp_deflate lisp_which lisp_zip  ];
      inherit stdenv;
      systemName = "trivial-extract";
      
      sourceProject = "${lisp-project_trivial-extract}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_archive} ${lisp_cl-fad} ${lisp_deflate} ${lisp_which} ${lisp_zip}";
      name = "lisp_trivial-extract-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
