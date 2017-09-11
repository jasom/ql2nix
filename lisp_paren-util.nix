
{ buildLispPackage, stdenv, fetchurl, lisp-project_paren-util, 
   lisp_paren-files, lisp_parenscript,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_paren-files lisp_parenscript  ];
      inherit stdenv;
      systemName = "paren-util";
      
      sourceProject = "${lisp-project_paren-util}";
      patches = [];
      lisp_dependencies = "${lisp_paren-files} ${lisp_parenscript}";
      name = "lisp_paren-util-20110418-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
