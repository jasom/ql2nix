
{ buildLispPackage, stdenv, fetchurl, lisp-project_codex, 
   lisp_cl-slug, lisp_djula, lisp_pandocl, lisp_common-doc-contrib, lisp_common-doc, lisp_docparser,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_cl-slug lisp_djula lisp_pandocl lisp_common-doc-contrib lisp_common-doc lisp_docparser  ];
      inherit stdenv;
      systemName = "codex";
      
      sourceProject = "${lisp-project_codex}";
      patches = [];
      lisp_dependencies = "${lisp_cl-slug} ${lisp_djula} ${lisp_pandocl} ${lisp_common-doc-contrib} ${lisp_common-doc} ${lisp_docparser}";
      name = "lisp_codex-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
