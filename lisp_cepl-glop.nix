
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-glop, 
   lisp_glop, lisp_cepl,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_glop lisp_cepl  ];
      inherit stdenv;
      systemName = "cepl.glop";
      
      sourceProject = "${lisp-project_cepl-glop}";
      patches = [];
      lisp_dependencies = "${lisp_glop} ${lisp_cepl}";
      name = "lisp_cepl-glop-release-quicklisp-b7bff23e-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
