
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-skitter, 
   lisp_skitter-glop, lisp_cepl-glop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_skitter-glop lisp_cepl-glop  ];
      inherit stdenv;
      systemName = "cepl.skitter.glop";
      
      sourceProject = "${lisp-project_cepl-skitter}";
      patches = [];
      lisp_dependencies = "${lisp_skitter-glop} ${lisp_cepl-glop}";
      name = "lisp_cepl-skitter-glop-release-quicklisp-f52b9240-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
