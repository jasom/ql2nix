
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-builder-protocol, 
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
      systemName = "architecture.builder-protocol";
      
      sourceProject = "${lisp-project_architecture-builder-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria}";
      name = "lisp_architecture-builder-protocol-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
