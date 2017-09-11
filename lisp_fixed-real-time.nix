
{ buildLispPackage, stdenv, fetchurl, lisp-project_fixed, 
   lisp_fixed,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fixed  ];
      inherit stdenv;
      systemName = "fixed/real-time";
      
      sourceProject = "${lisp-project_fixed}";
      patches = [];
      lisp_dependencies = "${lisp_fixed}";
      name = "lisp_fixed-real-time-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
