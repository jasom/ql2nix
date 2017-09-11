
{ buildLispPackage, stdenv, fetchurl, lisp-project_projectured, 
   lisp_hu-dwim-asdf, lisp_hu-dwim-common, lisp_hu-dwim-def, lisp_hu-dwim-defclass-star, lisp_hu-dwim-logger, lisp_hu-dwim-serializer, lisp_hu-dwim-syntax-sugar, lisp_hu-dwim-util, lisp_trivial-garbage,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_hu-dwim-asdf lisp_hu-dwim-common lisp_hu-dwim-def lisp_hu-dwim-defclass-star lisp_hu-dwim-logger lisp_hu-dwim-serializer lisp_hu-dwim-syntax-sugar lisp_hu-dwim-util lisp_trivial-garbage  ];
      inherit stdenv;
      systemName = "projectured.editor";
      
      sourceProject = "${lisp-project_projectured}";
      patches = [];
      lisp_dependencies = "${lisp_hu-dwim-asdf} ${lisp_hu-dwim-common} ${lisp_hu-dwim-def} ${lisp_hu-dwim-defclass-star} ${lisp_hu-dwim-logger} ${lisp_hu-dwim-serializer} ${lisp_hu-dwim-syntax-sugar} ${lisp_hu-dwim-util} ${lisp_trivial-garbage}";
      name = "lisp_projectured-editor-quicklisp-c1e554b1-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
