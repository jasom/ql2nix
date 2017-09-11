
{ buildLispPackage, stdenv, fetchurl, lisp-project_cartesian-product-switch, 
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
      systemName = "cartesian-product-switch";
      
      sourceProject = "${lisp-project_cartesian-product-switch}";
      patches = [];
      lisp_dependencies = "${lisp_map-bind}";
      name = "lisp_cartesian-product-switch-2.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
