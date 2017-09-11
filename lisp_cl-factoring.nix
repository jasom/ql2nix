
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-factoring, 
   lisp_cl-primality, lisp_iterate,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-primality lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-factoring";
      
      sourceProject = "${lisp-project_cl-factoring}";
      patches = [];
      lisp_dependencies = "${lisp_cl-primality} ${lisp_iterate}";
      name = "lisp_cl-factoring-20150608-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
