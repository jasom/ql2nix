
{ buildLispPackage, stdenv, fetchurl, lisp-project_rutils, 
   lisp_named-readtables,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "rutils";
      
      sourceProject = "${lisp-project_rutils}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_rutils-20170830-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
