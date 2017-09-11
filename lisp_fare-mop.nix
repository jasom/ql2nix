
{ buildLispPackage, stdenv, fetchurl, lisp-project_fare-mop, 
   lisp_closer-mop, lisp_fare-utils,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fare-utils  ];
      inherit stdenv;
      systemName = "fare-mop";
      
      sourceProject = "${lisp-project_fare-mop}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fare-utils}";
      name = "lisp_fare-mop-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
