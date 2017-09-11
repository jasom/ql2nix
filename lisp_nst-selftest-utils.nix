
{ buildLispPackage, stdenv, fetchurl, lisp-project_nst, 
   lisp_nst,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nst  ];
      inherit stdenv;
      systemName = "nst-selftest-utils";
      
      sourceProject = "${lisp-project_nst}";
      patches = [];
      lisp_dependencies = "${lisp_nst}";
      name = "lisp_nst-selftest-utils-4.1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
