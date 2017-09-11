
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-interface-library, 
   lisp_closer-mop, lisp_fare-utils, lisp_alexandria, lisp_fare-memoization,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fare-utils lisp_alexandria lisp_fare-memoization  ];
      inherit stdenv;
      systemName = "lil";
      
      sourceProject = "${lisp-project_lisp-interface-library}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fare-utils} ${lisp_alexandria} ${lisp_fare-memoization}";
      name = "lisp_lil-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
