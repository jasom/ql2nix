
{ buildLispPackage, stdenv, fetchurl, lisp-project_symbol-namespaces, 
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
      systemName = "symbol-namespaces";
      
      sourceProject = "${lisp-project_symbol-namespaces}";
      patches = [];
      lisp_dependencies = "${lisp_map-bind}";
      name = "lisp_symbol-namespaces-1.0";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
