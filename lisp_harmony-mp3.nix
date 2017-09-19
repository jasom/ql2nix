
{ buildLispPackage, stdenv, fetchurl, lisp-project_harmony, 
   lisp_cl-mpg123, lisp_bordeaux-threads, lisp_flow, lisp_cl-mixed,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-mpg123 lisp_bordeaux-threads lisp_flow lisp_cl-mixed  ];
      inherit stdenv;
      systemName = "harmony-mp3";
      
      sourceProject = "${lisp-project_harmony}";
      patches = [];
      lisp_dependencies = "${lisp_cl-mpg123} ${lisp_bordeaux-threads} ${lisp_flow} ${lisp_cl-mixed}";
      name = "lisp_harmony-mp3-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
