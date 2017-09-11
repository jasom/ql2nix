
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman2-widgets, 
   lisp_trivial-garbage, lisp_moptilities, lisp_caveman2,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-garbage lisp_moptilities lisp_caveman2  ];
      inherit stdenv;
      systemName = "caveman2-widgets";
      
      sourceProject = "${lisp-project_caveman2-widgets}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-garbage} ${lisp_moptilities} ${lisp_caveman2}";
      name = "lisp_caveman2-widgets-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
