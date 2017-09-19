
{ buildLispPackage, stdenv, fetchurl, lisp-project_trivial-extract, 
   lisp_which, lisp_deflate, lisp_zip, lisp_archive,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_which lisp_deflate lisp_zip lisp_archive  ];
      inherit stdenv;
      systemName = "trivial-extract";
      
      sourceProject = "${lisp-project_trivial-extract}";
      patches = [];
      lisp_dependencies = "${lisp_which} ${lisp_deflate} ${lisp_zip} ${lisp_archive}";
      name = "lisp_trivial-extract-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
