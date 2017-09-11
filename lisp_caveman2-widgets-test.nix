
{ buildLispPackage, stdenv, fetchurl, lisp-project_caveman2-widgets, 
   lisp_prove-asdf, lisp_caveman2-widgets,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_prove-asdf lisp_caveman2-widgets  ];
      inherit stdenv;
      systemName = "caveman2-widgets-test";
      
      sourceProject = "${lisp-project_caveman2-widgets}";
      patches = [];
      lisp_dependencies = "${lisp_prove-asdf} ${lisp_caveman2-widgets}";
      name = "lisp_caveman2-widgets-test-20170630-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
