
{ buildLispPackage, stdenv, fetchurl, lisp-project_method-combination-utilities, 
   lisp_closer-mop,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "method-combination-utilities";
      
      sourceProject = "${lisp-project_method-combination-utilities}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_method-combination-utilities-20141106-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
