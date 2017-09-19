
{ buildLispPackage, stdenv, fetchurl, lisp-project_rutils, 
   lisp_closer-mop, lisp_named-readtables,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_named-readtables  ];
      inherit stdenv;
      systemName = "rutilsx";
      
      sourceProject = "${lisp-project_rutils}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_named-readtables}";
      name = "lisp_rutilsx-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
