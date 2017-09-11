
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump-bundle, 
   lisp_plump-dom, lisp_babel, lisp_fast-io, lisp_closer-mop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_plump-dom lisp_babel lisp_fast-io lisp_closer-mop  ];
      inherit stdenv;
      systemName = "plump-bundle";
      
      sourceProject = "${lisp-project_plump-bundle}";
      patches = [];
      lisp_dependencies = "${lisp_plump-dom} ${lisp_babel} ${lisp_fast-io} ${lisp_closer-mop}";
      name = "lisp_plump-bundle-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
