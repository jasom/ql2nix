
{ buildLispPackage, stdenv, fetchurl, lisp-project_pandocl, 
   lisp_common-html, lisp_thorn, lisp_parenml, lisp_scriba, lisp_vertex, lisp_common-doc-contrib, lisp_common-doc,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_common-html lisp_thorn lisp_parenml lisp_scriba lisp_vertex lisp_common-doc-contrib lisp_common-doc  ];
      inherit stdenv;
      systemName = "pandocl";
      
      sourceProject = "${lisp-project_pandocl}";
      patches = [];
      lisp_dependencies = "${lisp_common-html} ${lisp_thorn} ${lisp_parenml} ${lisp_scriba} ${lisp_vertex} ${lisp_common-doc-contrib} ${lisp_common-doc}";
      name = "lisp_pandocl-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
