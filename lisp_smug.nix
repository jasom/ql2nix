
{ buildLispPackage, stdenv, fetchurl, lisp-project_smug, 
   lisp_asdf-package-system,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system  ];
      inherit stdenv;
      systemName = "smug";
      
      sourceProject = "${lisp-project_smug}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system}";
      name = "lisp_smug-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
