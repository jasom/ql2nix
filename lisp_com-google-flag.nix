
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-gflags, 
   lisp_com-google-base,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-base  ];
      inherit stdenv;
      systemName = "com.google.flag";
      
      sourceProject = "${lisp-project_lisp-gflags}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-base}";
      name = "lisp_com-google-flag-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
