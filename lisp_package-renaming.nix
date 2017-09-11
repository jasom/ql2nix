
{ buildLispPackage, stdenv, fetchurl, lisp-project_package-renaming, 
   lisp_alexandria,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria  ];
      inherit stdenv;
      systemName = "package-renaming";
      
      sourceProject = "${lisp-project_package-renaming}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_package-renaming-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
