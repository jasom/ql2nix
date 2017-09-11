
{ buildLispPackage, stdenv, fetchurl, lisp-project_skitter, 
   lisp_skitter, lisp_glop,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_skitter lisp_glop  ];
      inherit stdenv;
      systemName = "skitter.glop";
      
      sourceProject = "${lisp-project_skitter}";
      patches = [];
      lisp_dependencies = "${lisp_skitter} ${lisp_glop}";
      name = "lisp_skitter-glop-release-quicklisp-dd15a0b5-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
