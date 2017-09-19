
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-coveralls, 
   lisp_dexador, lisp_jonathan, lisp_lquery, lisp_ironclad,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_dexador lisp_jonathan lisp_lquery lisp_ironclad  ];
      inherit stdenv;
      systemName = "cl-coveralls";
      
      sourceProject = "${lisp-project_cl-coveralls}";
      patches = [];
      lisp_dependencies = "${lisp_dexador} ${lisp_jonathan} ${lisp_lquery} ${lisp_ironclad}";
      name = "lisp_cl-coveralls-20151218-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
