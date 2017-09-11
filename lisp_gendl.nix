
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_cl-lite, lisp_gwl-graphics, lisp_robot, lisp_tasty, lisp_yadd,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-lite lisp_gwl-graphics lisp_robot lisp_tasty lisp_yadd  ];
      inherit stdenv;
      systemName = "gendl";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_cl-lite} ${lisp_gwl-graphics} ${lisp_robot} ${lisp_tasty} ${lisp_yadd}";
      name = "lisp_gendl-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
