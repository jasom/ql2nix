
{ buildLispPackage, stdenv, fetchurl, lisp-project_arrow-macros, 
   lisp_arrow-macros, lisp_fiveam,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_arrow-macros lisp_fiveam  ];
      inherit stdenv;
      systemName = "arrow-macros-test";
      
      sourceProject = "${lisp-project_arrow-macros}";
      patches = [];
      lisp_dependencies = "${lisp_arrow-macros} ${lisp_fiveam}";
      name = "lisp_arrow-macros-test-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
