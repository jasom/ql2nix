
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-markdown, 
   lisp_anaphora, lisp_cl-containers, lisp_cl-ppcre, lisp_dynamic-classes, lisp_metabang-bind, lisp_metatilities-base,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_cl-containers lisp_cl-ppcre lisp_dynamic-classes lisp_metabang-bind lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "cl-markdown";
      
      sourceProject = "${lisp-project_cl-markdown}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_cl-containers} ${lisp_cl-ppcre} ${lisp_dynamic-classes} ${lisp_metabang-bind} ${lisp_metatilities-base}";
      name = "lisp_cl-markdown-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
