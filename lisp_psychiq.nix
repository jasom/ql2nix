
{ buildLispPackage, stdenv, fetchurl, lisp-project_psychiq, 
   lisp_alexandria, lisp_bordeaux-threads, lisp_cl-redis, lisp_cl-reexport, lisp_dissect, lisp_jonathan, lisp_local-time, lisp_vom,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_bordeaux-threads lisp_cl-redis lisp_cl-reexport lisp_dissect lisp_jonathan lisp_local-time lisp_vom  ];
      inherit stdenv;
      systemName = "psychiq";
      
      sourceProject = "${lisp-project_psychiq}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_bordeaux-threads} ${lisp_cl-redis} ${lisp_cl-reexport} ${lisp_dissect} ${lisp_jonathan} ${lisp_local-time} ${lisp_vom}";
      name = "lisp_psychiq-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
