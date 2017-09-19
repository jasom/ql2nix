
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-ohm, 
   lisp_cl-redis, lisp_closer-mop, lisp_alexandria,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-redis lisp_closer-mop lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-ohm";
      
      sourceProject = "${lisp-project_cl-ohm}";
      patches = [];
      lisp_dependencies = "${lisp_cl-redis} ${lisp_closer-mop} ${lisp_alexandria}";
      name = "lisp_cl-ohm-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
