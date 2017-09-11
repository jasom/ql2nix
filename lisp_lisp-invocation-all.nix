
{ buildLispPackage, stdenv, fetchurl, lisp-project_lisp-invocation, 
   lisp_fare-utils,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fare-utils  ];
      inherit stdenv;
      systemName = "lisp-invocation/all";
      
      sourceProject = "${lisp-project_lisp-invocation}";
      patches = [];
      lisp_dependencies = "${lisp_fare-utils}";
      name = "lisp_lisp-invocation-all-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
