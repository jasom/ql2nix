
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-kanren, 
   lisp_alexandria, lisp_cl-kanren, lisp_clunit,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_cl-kanren lisp_clunit  ];
      inherit stdenv;
      systemName = "cl-kanren-test";
      
      sourceProject = "${lisp-project_cl-kanren}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_cl-kanren} ${lisp_clunit}";
      name = "lisp_cl-kanren-test-20170725-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
