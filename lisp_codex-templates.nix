
{ buildLispPackage, stdenv, fetchurl, lisp-project_codex, 
   lisp_djula, lisp_common-html,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_djula lisp_common-html  ];
      inherit stdenv;
      systemName = "codex-templates";
      
      sourceProject = "${lisp-project_codex}";
      patches = [];
      lisp_dependencies = "${lisp_djula} ${lisp_common-html}";
      name = "lisp_codex-templates-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
