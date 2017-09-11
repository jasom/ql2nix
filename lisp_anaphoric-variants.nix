
{ buildLispPackage, stdenv, fetchurl, lisp-project_anaphoric-variants, 
   lisp_map-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_map-bind  ];
      inherit stdenv;
      systemName = "anaphoric-variants";
      
      sourceProject = "${lisp-project_anaphoric-variants}";
      patches = [];
      lisp_dependencies = "${lisp_map-bind}";
      name = "lisp_anaphoric-variants-1.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
