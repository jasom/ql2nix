
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-github-v3, 
   lisp_alexandria, lisp_drakma, lisp_yason,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_drakma lisp_yason  ];
      inherit stdenv;
      systemName = "cl-github-v3";
      
      sourceProject = "${lisp-project_cl-github-v3}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_drakma} ${lisp_yason}";
      name = "lisp_cl-github-v3-20130312-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }