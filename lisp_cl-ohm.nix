
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ohm, 
   lisp_alexandria, lisp_closer-mop, lisp_cl-redis,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_closer-mop lisp_cl-redis  ];
      inherit stdenv;
      systemName = "cl-ohm";
      
      sourceProject = "${lisp-project_cl-ohm}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_closer-mop} ${lisp_cl-redis}";
      name = "lisp_cl-ohm-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
