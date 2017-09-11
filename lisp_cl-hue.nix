
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-hue, 
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
      systemName = "cl-hue";
      
      sourceProject = "${lisp-project_cl-hue}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_drakma} ${lisp_yason}";
      name = "lisp_cl-hue-20150113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
