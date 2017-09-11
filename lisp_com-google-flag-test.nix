
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-gflags, 
   lisp_com-google-flag, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_com-google-flag lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "com.google.flag-test";
      
      sourceProject = "${lisp-project_lisp-gflags}";
      patches = [];
      lisp_dependencies = "${lisp_com-google-flag} ${lisp_hu-dwim-stefil}";
      name = "lisp_com-google-flag-test-20151031-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
