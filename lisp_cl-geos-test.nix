
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-geos, 
   lisp_cl-geos, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-geos lisp_fiveam  ];
      inherit stdenv;
      systemName = "cl-geos/test";
      
      sourceProject = "${lisp-project_cl-geos}";
      patches = [];
      lisp_dependencies = "${lisp_cl-geos} ${lisp_fiveam}";
      name = "lisp_cl-geos-test-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
