
{ buildLispPackage, stdenv, fetchurl, lisp-project_montezuma, 
   lisp_babel, lisp_cl-ppcre, lisp_cl-fad,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_babel lisp_cl-ppcre lisp_cl-fad  ];
      inherit stdenv;
      systemName = "montezuma-indexfiles";
      
      sourceProject = "${lisp-project_montezuma}";
      patches = [];
      lisp_dependencies = "${lisp_babel} ${lisp_cl-ppcre} ${lisp_cl-fad}";
      name = "lisp_montezuma-indexfiles-20170227-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
