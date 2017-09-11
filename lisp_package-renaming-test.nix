
{ buildLispPackage, stdenv, fetchurl, lisp-project_package-renaming, 
   lisp_hu-dwim-stefil, lisp_package-renaming,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-stefil lisp_package-renaming  ];
      inherit stdenv;
      systemName = "package-renaming-test";
      
      sourceProject = "${lisp-project_package-renaming}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-stefil} ${lisp_package-renaming}";
      name = "lisp_package-renaming-test-20120407-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
