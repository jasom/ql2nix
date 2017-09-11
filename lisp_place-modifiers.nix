
{ buildLispPackage, stdenv, fetchurl, lisp-project_place-modifiers, 
   lisp_cartesian-product-switch, lisp_map-bind,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cartesian-product-switch lisp_map-bind  ];
      inherit stdenv;
      systemName = "place-modifiers";
      
      sourceProject = "${lisp-project_place-modifiers}";
      patches = [];
      lisp_dependencies = "${lisp_cartesian-product-switch} ${lisp_map-bind}";
      name = "lisp_place-modifiers-2.1";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
