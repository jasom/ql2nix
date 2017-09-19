
{ buildLispPackage, stdenv, fetchurl, lisp-project_qt-libs, 
   lisp_cl-ppcre, lisp_pathname-utils, lisp_trivial-features,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-ppcre lisp_pathname-utils lisp_trivial-features  ];
      inherit stdenv;
      systemName = "qt-lib-generator";
      
      sourceProject = "${lisp-project_qt-libs}";
      patches = [];
      lisp_dependencies = "${lisp_cl-ppcre} ${lisp_pathname-utils} ${lisp_trivial-features}";
      name = "lisp_qt-lib-generator-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
