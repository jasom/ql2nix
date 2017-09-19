
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman2-widgets, 
   lisp_caveman2, lisp_moptilities, lisp_trivial-garbage,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_caveman2 lisp_moptilities lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "caveman2-widgets";
      
      sourceProject = "${lisp-project_caveman2-widgets}";
      patches = [];
      lisp_dependencies = "${lisp_caveman2} ${lisp_moptilities} ${lisp_trivial-garbage}";
      name = "lisp_caveman2-widgets-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
