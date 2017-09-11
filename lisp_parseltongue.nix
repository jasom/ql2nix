
{ buildLispPackage, stdenv, fetchurl, lisp-project_parseltongue, 
   lisp_lisp-unit,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "parseltongue";
      
      sourceProject = "${lisp-project_parseltongue}";
      patches = [];
      lisp_dependencies = "${lisp_lisp-unit}";
      name = "lisp_parseltongue-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
