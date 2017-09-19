
{ buildLispPackage, stdenv, fetchurl, lisp-project_plump-bundle, 
   lisp_closer-mop, lisp_fast-io, lisp_babel, lisp_plump-dom,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_fast-io lisp_babel lisp_plump-dom  ];
      inherit stdenv;
      systemName = "plump-bundle";
      
      sourceProject = "${lisp-project_plump-bundle}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_fast-io} ${lisp_babel} ${lisp_plump-dom}";
      name = "lisp_plump-bundle-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
