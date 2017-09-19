
{ buildLispPackage, stdenv, fetchurl, lisp-project_named-readtables, 
   lisp_mgl-pax,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_mgl-pax  ];
      inherit stdenv;
      systemName = "named-readtables/doc";
      
      sourceProject = "${lisp-project_named-readtables}";
      patches = [];
      lisp_dependencies = "${lisp_mgl-pax}";
      name = "lisp_named-readtables-doc-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
