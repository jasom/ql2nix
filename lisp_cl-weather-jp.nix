
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-weather-jp, 
   lisp_function-cache, lisp_jonathan, lisp_clss, lisp_plump, lisp_dexador,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_function-cache lisp_jonathan lisp_clss lisp_plump lisp_dexador  ];
      inherit stdenv;
      systemName = "cl-weather-jp";
      
      sourceProject = "${lisp-project_cl-weather-jp}";
      patches = [];
      lisp_dependencies = "${lisp_function-cache} ${lisp_jonathan} ${lisp_clss} ${lisp_plump} ${lisp_dexador}";
      name = "lisp_cl-weather-jp-20160208-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
