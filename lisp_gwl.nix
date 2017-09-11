
{ buildLispPackage, stdenv, fetchurl, lisp-project_gendl, 
   lisp_aserve, lisp_bordeaux-threads, lisp_glisp, lisp_yason,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_aserve lisp_bordeaux-threads lisp_glisp lisp_yason  ];
      inherit stdenv;
      systemName = "gwl";
      
      sourceProject = "${lisp-project_gendl}";
      patches = [];
      lisp_dependencies = "${lisp_aserve} ${lisp_bordeaux-threads} ${lisp_glisp} ${lisp_yason}";
      name = "lisp_gwl-devo-0272a167-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
