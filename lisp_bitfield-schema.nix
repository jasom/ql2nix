
{ buildLispPackage, stdenv, fetchurl, lisp-project_bitfield-schema, 
   lisp_iterate,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_iterate  ];
      inherit stdenv;
      systemName = "bitfield-schema";
      
      sourceProject = "${lisp-project_bitfield-schema}";
      patches = [];
      lisp_dependencies = "${lisp_iterate}";
      name = "lisp_bitfield-schema-20120107-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
