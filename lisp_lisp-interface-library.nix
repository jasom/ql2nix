
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-interface-library, 
   lisp_fare-memoization, lisp_alexandria, lisp_fare-utils, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-memoization lisp_alexandria lisp_fare-utils lisp_closer-mop  ];
      inherit stdenv;
      systemName = "lisp-interface-library";
      
      sourceProject = "${lisp-project_lisp-interface-library}";
      patches = [];
      lisp_dependencies = "${lisp_fare-memoization} ${lisp_alexandria} ${lisp_fare-utils} ${lisp_closer-mop}";
      name = "lisp_lisp-interface-library-20160531-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
