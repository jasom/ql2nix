
{ buildLispPackage, stdenv, fetchurl, lisp-project_cffi-objects, 
   lisp_cffi-objects, lisp_hu-dwim-stefil,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cffi-objects lisp_hu-dwim-stefil  ];
      inherit stdenv;
      systemName = "cffi-objects.tests";
      
      sourceProject = "${lisp-project_cffi-objects}";
      patches = [];
      lisp_dependencies = "${lisp_cffi-objects} ${lisp_hu-dwim-stefil}";
      name = "lisp_cffi-objects-tests-20140713-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
