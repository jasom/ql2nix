
{ buildLispPackage, stdenv, fetchurl, lisp-project_cepl-skitter, 
   lisp_cepl-glop, lisp_skitter-glop,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cepl-glop lisp_skitter-glop  ];
      inherit stdenv;
      systemName = "cepl.skitter.glop";
      
      sourceProject = "${lisp-project_cepl-skitter}";
      patches = [];
      lisp_dependencies = "${lisp_cepl-glop} ${lisp_skitter-glop}";
      name = "lisp_cepl-skitter-glop-release-quicklisp-f52b9240-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
