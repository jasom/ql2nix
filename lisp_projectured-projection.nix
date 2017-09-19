
{ buildLispPackage, stdenv, fetchurl, lisp-project_projectured, 
   lisp_s-xml, lisp_parse-number, lisp_cl-json, lisp_hu-dwim-serializer, lisp_hu-dwim-logger, lisp_hu-dwim-def, lisp_hu-dwim-defclass-star, lisp_hu-dwim-common, lisp_hu-dwim-asdf,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_s-xml lisp_parse-number lisp_cl-json lisp_hu-dwim-serializer lisp_hu-dwim-logger lisp_hu-dwim-def lisp_hu-dwim-defclass-star lisp_hu-dwim-common lisp_hu-dwim-asdf  ];
      inherit stdenv;
      systemName = "projectured.projection";
      
      sourceProject = "${lisp-project_projectured}";
      patches = [];
      lisp_dependencies = "${lisp_s-xml} ${lisp_parse-number} ${lisp_cl-json} ${lisp_hu-dwim-serializer} ${lisp_hu-dwim-logger} ${lisp_hu-dwim-def} ${lisp_hu-dwim-defclass-star} ${lisp_hu-dwim-common} ${lisp_hu-dwim-asdf}";
      name = "lisp_projectured-projection-quicklisp-c1e554b1-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
