
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-markdown, 
   lisp_lift, lisp_trivial-shell, lisp_html-encode, lisp_cl-html-diff, lisp_lml2, lisp_cl-ppcre, lisp_anaphora, lisp_cl-containers, lisp_dynamic-classes, lisp_metabang-bind, lisp_metatilities-base,  
  ccl, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_lift lisp_trivial-shell lisp_html-encode lisp_cl-html-diff lisp_lml2 lisp_cl-ppcre lisp_anaphora lisp_cl-containers lisp_dynamic-classes lisp_metabang-bind lisp_metatilities-base  ];
      inherit stdenv;
      systemName = "cl-markdown-comparisons";
      
      sourceProject = "${lisp-project_cl-markdown}";
      patches = [];
      lisp_dependencies = "${lisp_lift} ${lisp_trivial-shell} ${lisp_html-encode} ${lisp_cl-html-diff} ${lisp_lml2} ${lisp_cl-ppcre} ${lisp_anaphora} ${lisp_cl-containers} ${lisp_dynamic-classes} ${lisp_metabang-bind} ${lisp_metatilities-base}";
      name = "lisp_cl-markdown-comparisons-20101006-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.sbcl}" ];
    }
