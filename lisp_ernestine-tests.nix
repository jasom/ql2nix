
{ buildLispPackage, stdenv, fetchurl, lisp-project_ernestine, 
   lisp_ernestine, lisp_lisp-unit,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_ernestine lisp_lisp-unit  ];
      inherit stdenv;
      systemName = "ernestine-tests";
      
      sourceProject = "${lisp-project_ernestine}";
      patches = [];
      lisp_dependencies = "${lisp_ernestine} ${lisp_lisp-unit}";
      name = "lisp_ernestine-tests-20161204-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
