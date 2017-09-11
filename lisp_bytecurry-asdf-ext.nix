
{ buildLispPackage, stdenv, fetchurl, lisp-project_bytecurry-asdf-ext, 
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
      systemName = "bytecurry.asdf-ext";
      
      sourceProject = "${lisp-project_bytecurry-asdf-ext}";
      patches = [];
      lisp_dependencies = "${lisp_asdf-package-system}";
      name = "lisp_bytecurry-asdf-ext-20150505-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
