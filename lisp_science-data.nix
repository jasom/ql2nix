
{ buildLispPackage, stdenv, fetchurl, lisp-project_antik, 
   lisp_drakma, lisp_physical-dimension,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_drakma lisp_physical-dimension  ];
      inherit stdenv;
      systemName = "science-data";
      
      sourceProject = "${lisp-project_antik}";
      patches = [];
      lisp_dependencies = "${lisp_drakma} ${lisp_physical-dimension}";
      name = "lisp_science-data-master-ad6432e3-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
