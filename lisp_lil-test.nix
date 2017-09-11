
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-interface-library, 
   lisp_closer-mop, lisp_fare-utils, lisp_alexandria, lisp_fare-memoization, lisp_reader-interception, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fare-utils lisp_alexandria lisp_fare-memoization lisp_reader-interception lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "lil/test";
      
      sourceProject = "${lisp-project_lisp-interface-library}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fare-utils} ${lisp_alexandria} ${lisp_fare-memoization} ${lisp_reader-interception} ${lisp_hu-dwim-stefil}";
      name = "lisp_lil-test-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
