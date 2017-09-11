
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-variates, 
   lisp_asdf-system-connections,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-system-connections  ];
      inherit stdenv;
      systemName = "cl-variates";
      
      sourceProject = "${lisp-project_cl-variates}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-system-connections}";
      name = "lisp_cl-variates-20140211-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
