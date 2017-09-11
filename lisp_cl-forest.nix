
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-forest, 
   lisp_drakma, lisp_yason, lisp_ieee-floats,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_yason lisp_ieee-floats  ];
      inherit stdenv;
      systemName = "cl-forest";
      
      sourceProject = "${lisp-project_cl-forest}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_yason} ${lisp_ieee-floats}";
      name = "lisp_cl-forest-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
