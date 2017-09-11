
{ buildLispPackage, stdenv, fetchurl, lisp-project_binge, 
   lisp_binge,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_binge  ];
      inherit stdenv;
      systemName = "binge-tests";
      
      sourceProject = "${lisp-project_binge}";
      patches = [];
      lisp_dependencies = "${lisp_binge}";
      name = "lisp_binge-tests-20150207T212203";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
