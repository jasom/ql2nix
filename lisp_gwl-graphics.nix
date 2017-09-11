
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_geom-base, lisp_gwl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_geom-base lisp_gwl  ];
      inherit stdenv;
      systemName = "gwl-graphics";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_geom-base} ${lisp_gwl}";
      name = "lisp_gwl-graphics-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
