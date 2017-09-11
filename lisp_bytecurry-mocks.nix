
{ buildLispPackage, stdenv, fetchurl, lisp-project_bytecurry-mocks, 
   lisp_asdf-package-system, lisp_bytecurry-asdf-ext,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_asdf-package-system lisp_bytecurry-asdf-ext  ];
      inherit stdenv;
      systemName = "bytecurry.mocks";
      
      sourceProject = "${lisp-project_bytecurry-mocks}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system} ${lisp_bytecurry-asdf-ext}";
      name = "lisp_bytecurry-mocks-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
