
{ buildLispPackage, stdenv, fetchurl, lisp-project_paren-files, 
   lisp_parenscript,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parenscript  ];
      inherit stdenv;
      systemName = "paren-files";
      
      sourceProject = "${lisp-project_paren-files}";
      patches = [];
      lisp_dependencies = "${lisp_parenscript}";
      name = "lisp_paren-files-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
