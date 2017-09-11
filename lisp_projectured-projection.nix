
{ buildLispPackage, stdenv, fetchurl, lisp-project_projectured, 
   lisp_hu-dwim-asdf, lisp_projectured-document, lisp_projectured-editor,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_projectured-document lisp_projectured-editor  ];
      inherit stdenv;
      systemName = "projectured.projection";
      
      sourceProject = "${lisp-project_projectured}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_projectured-document} ${lisp_projectured-editor}";
      name = "lisp_projectured-projection-quicklisp-c1e554b1-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
