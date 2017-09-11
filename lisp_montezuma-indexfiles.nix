
{ buildLispPackage, stdenv, fetchurl, lisp-project_montezuma, 
   lisp_cl-fad, lisp_montezuma,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-fad lisp_montezuma  ];
      inherit stdenv;
      systemName = "montezuma-indexfiles";
      
      sourceProject = "${lisp-project_montezuma}";
      patches = [];
      lisp_dependencies = "${lisp_cl-fad} ${lisp_montezuma}";
      name = "lisp_montezuma-indexfiles-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
