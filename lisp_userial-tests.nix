
{ buildLispPackage, stdenv, fetchurl, lisp-project_userial, 
   lisp_nst, lisp_userial,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_nst lisp_userial  ];
      inherit stdenv;
      systemName = "userial-tests";
      
      sourceProject = "${lisp-project_userial}";
      patches = [];
      lisp_dependencies = "${lisp_nst} ${lisp_userial}";
      name = "lisp_userial-tests_0.8.2011.06.02";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
