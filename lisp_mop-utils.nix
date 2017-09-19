
{ buildLispPackage, stdenv, fetchurl, lisp-project_mop-utils, 
   lisp_closer-mop,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop  ];
      inherit stdenv;
      systemName = "mop-utils";
      
      sourceProject = "${lisp-project_mop-utils}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop}";
      name = "lisp_mop-utils-20120811-http";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
