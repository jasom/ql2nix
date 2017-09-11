
{ buildLispPackage, stdenv, fetchurl, lisp-project_contextl, 
   lisp_lw-compat,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lw-compat  ];
      inherit stdenv;
      systemName = "dynamic-wind";
      
      sourceProject = "${lisp-project_contextl}";
      patches = [];
      lisp_dependencies = "${lisp_lw-compat}";
      name = "lisp_dynamic-wind-20160318-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
