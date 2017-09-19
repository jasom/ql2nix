
{ buildLispPackage, stdenv, fetchurl, lisp-project_multiple-value-variants, 
   lisp_enhanced-multiple-value-bind, lisp_positional-lambda, lisp_map-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_enhanced-multiple-value-bind lisp_positional-lambda lisp_map-bind  ];
      inherit stdenv;
      systemName = "multiple-value-variants";
      
      sourceProject = "${lisp-project_multiple-value-variants}";
      patches = [];
      lisp_dependencies = "${lisp_enhanced-multiple-value-bind} ${lisp_positional-lambda} ${lisp_map-bind}";
      name = "lisp_multiple-value-variants-1.0.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
