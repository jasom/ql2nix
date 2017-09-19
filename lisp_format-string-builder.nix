
{ buildLispPackage, stdenv, fetchurl, lisp-project_format-string-builder, 
   lisp_serapeum, lisp_alexandria,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_serapeum lisp_alexandria  ];
      inherit stdenv;
      systemName = "format-string-builder";
      
      sourceProject = "${lisp-project_format-string-builder}";
      patches = [];
      lisp_dependencies = "${lisp_serapeum} ${lisp_alexandria}";
      name = "lisp_format-string-builder-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
