
{ buildLispPackage, stdenv, fetchurl, lisp-project_clipper, 
   lisp_opticl, lisp_zs3, lisp_dexador, lisp_closer-mop, lisp_cl-syntax-annot,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_opticl lisp_zs3 lisp_dexador lisp_closer-mop lisp_cl-syntax-annot  ];
      inherit stdenv;
      systemName = "clipper";
      
      sourceProject = "${lisp-project_clipper}";
      patches = [];
      lisp_dependencies = "${lisp_opticl} ${lisp_zs3} ${lisp_dexador} ${lisp_closer-mop} ${lisp_cl-syntax-annot}";
      name = "lisp_clipper-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
