
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ewkb, 
   lisp_flexi-streams, lisp_ieee-floats,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_flexi-streams lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "cl-ewkb";
      
      sourceProject = "${lisp-project_cl-ewkb}";
      patches = [];
      lisp_dependencies = "${lisp_flexi-streams} ${lisp_ieee-floats}";
      name = "lisp_cl-ewkb-20110619-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
