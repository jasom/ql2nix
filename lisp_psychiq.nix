
{ buildLispPackage, stdenv, fetchurl, lisp-project_psychiq, 
   lisp_vom, lisp_dissect, lisp_cl-reexport, lisp_local-time, lisp_jonathan, lisp_cl-redis,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_vom lisp_dissect lisp_cl-reexport lisp_local-time lisp_jonathan lisp_cl-redis  ];
      inherit stdenv;
      systemName = "psychiq";
      
      sourceProject = "${lisp-project_psychiq}";
      patches = [];
      lisp_dependencies = "${lisp_vom} ${lisp_dissect} ${lisp_cl-reexport} ${lisp_local-time} ${lisp_jonathan} ${lisp_cl-redis}";
      name = "lisp_psychiq-20170124-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
