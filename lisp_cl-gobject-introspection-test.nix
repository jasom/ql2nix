
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-gobject-introspection, 
   lisp_cl-gobject-introspection, lisp_fiveam, lisp_iterate,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-gobject-introspection lisp_fiveam lisp_iterate  ];
      inherit stdenv;
      systemName = "cl-gobject-introspection-test";
      
      sourceProject = "${lisp-project_cl-gobject-introspection}";
      patches = [];
      lisp_dependencies = "${lisp_cl-gobject-introspection} ${lisp_fiveam} ${lisp_iterate}";
      name = "lisp_cl-gobject-introspection-test-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
