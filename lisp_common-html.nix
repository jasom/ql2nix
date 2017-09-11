
{ buildLispPackage, stdenv, fetchurl, lisp-project_common-html, 
   lisp_alexandria, lisp_anaphora, lisp_common-doc, lisp_plump,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_alexandria lisp_anaphora lisp_common-doc lisp_plump  ];
      inherit stdenv;
      systemName = "common-html";
      
      sourceProject = "${lisp-project_common-html}";
      patches = [];
      lisp_dependencies = "${lisp_alexandria} ${lisp_anaphora} ${lisp_common-doc} ${lisp_plump}";
      name = "lisp_common-html-20160421-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
