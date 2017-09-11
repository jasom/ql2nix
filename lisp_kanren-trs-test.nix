
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-kanren-trs, 
   lisp_kanren-trs,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_kanren-trs  ];
      inherit stdenv;
      systemName = "kanren-trs-test";
      
      sourceProject = "${lisp-project_cl-kanren-trs}";
      patches = [];
      lisp_dependencies = "${lisp_kanren-trs}";
      name = "lisp_kanren-trs-test-20120305-svn";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
