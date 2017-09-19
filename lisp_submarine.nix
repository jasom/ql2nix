
{ buildLispPackage, stdenv, fetchurl, lisp-project_submarine, 
   lisp_mop-utils, lisp_iterate, lisp_postmodern,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mop-utils lisp_iterate lisp_postmodern  ];
      inherit stdenv;
      systemName = "submarine";
      
      sourceProject = "${lisp-project_submarine}";
      patches = [];
      lisp_dependencies = "${lisp_mop-utils} ${lisp_iterate} ${lisp_postmodern}";
      name = "lisp_submarine-20120909-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
