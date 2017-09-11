
{ buildLispPackage, stdenv, fetchurl, lisp-project_simple-routes, 
   lisp_hunchentoot,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hunchentoot  ];
      inherit stdenv;
      systemName = "simple-routes";
      
      sourceProject = "${lisp-project_simple-routes}";
      patches = [];
      lisp_dependencies = "${lisp_hunchentoot}";
      name = "lisp_simple-routes-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
