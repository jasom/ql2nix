
{ buildLispPackage, stdenv, fetchurl, lisp-project_asdf-linguist, 
   lisp_parenscript, lisp_inferior-shell,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_parenscript lisp_inferior-shell  ];
      inherit stdenv;
      systemName = "asdf-linguist";
      
      sourceProject = "${lisp-project_asdf-linguist}";
      patches = [];
      lisp_dependencies = "${lisp_parenscript} ${lisp_inferior-shell}";
      name = "lisp_asdf-linguist-20150923-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
