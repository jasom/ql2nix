
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl, 
   lisp_cepl, lisp_staple,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl lisp_staple  ];
      inherit stdenv;
      systemName = "cepl.documentation";
      
      sourceProject = "${lisp-project_cepl}";
      patches = [];
      lisp_dependencies = "${lisp_cepl} ${lisp_staple}";
      name = "lisp_cepl-documentation-release-quicklisp-d24231e2-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
