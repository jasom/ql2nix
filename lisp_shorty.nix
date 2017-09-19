
{ buildLispPackage, stdenv, fetchurl, lisp-project_shorty, 
   lisp_salza2, lisp_dexador,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_salza2 lisp_dexador  ];
      inherit stdenv;
      systemName = "shorty";
      
      sourceProject = "${lisp-project_shorty}";
      patches = [];
      lisp_dependencies = "${lisp_salza2} ${lisp_dexador}";
      name = "lisp_shorty-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
