
{ buildLispPackage, stdenv, fetchurl, lisp-project_parse-number-range, 
   lisp_cartesian-product-switch, lisp_enhanced-multiple-value-bind, lisp_map-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cartesian-product-switch lisp_enhanced-multiple-value-bind lisp_map-bind  ];
      inherit stdenv;
      systemName = "parse-number-range";
      
      sourceProject = "${lisp-project_parse-number-range}";
      patches = [];
      lisp_dependencies = "${lisp_cartesian-product-switch} ${lisp_enhanced-multiple-value-bind} ${lisp_map-bind}";
      name = "lisp_parse-number-range-1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
