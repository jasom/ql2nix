
{ buildLispPackage, stdenv, fetchurl, lisp-project_architecture-builder-protocol, 
   lisp_alexandria, lisp_closer-mop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop  ];
      inherit stdenv;
      systemName = "architecture.builder-protocol.universal-builder";
      
      sourceProject = "${lisp-project_architecture-builder-protocol}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop}";
      name = "lisp_architecture-builder-protocol-universal-builder-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
