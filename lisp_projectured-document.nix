
{ buildLispPackage, stdenv, fetchurl, lisp-project_projectured, 
   lisp_cl-json, lisp_hu-dwim-asdf, lisp_parse-number, lisp_projectured-editor, lisp_s-xml,  
  sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-json lisp_hu-dwim-asdf lisp_parse-number lisp_projectured-editor lisp_s-xml  ];
      inherit stdenv;
      systemName = "projectured.document";
      
      sourceProject = "${lisp-project_projectured}";
      patches = [];
      lisp_dependencies = "${lisp_cl-json} ${lisp_hu-dwim-asdf} ${lisp_parse-number} ${lisp_projectured-editor} ${lisp_s-xml}";
      name = "lisp_projectured-document-quicklisp-c1e554b1-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" ];
    }
