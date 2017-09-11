
{ buildLispPackage, stdenv, fetchurl, lisp-project_cmu-infix, 
   lisp_named-readtables,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_named-readtables  ];
      inherit stdenv;
      systemName = "cmu-infix";
      
      sourceProject = "${lisp-project_cmu-infix}";
      patches = [];
      lisp_dependencies = "${lisp_named-readtables}";
      name = "lisp_cmu-infix-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
