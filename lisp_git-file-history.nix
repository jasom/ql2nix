
{ buildLispPackage, stdenv, fetchurl, lisp-project_git-file-history, 
   lisp_local-time, lisp_legit,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_local-time lisp_legit  ];
      inherit stdenv;
      systemName = "git-file-history";
      
      sourceProject = "${lisp-project_git-file-history}";
      patches = [];
      lisp_dependencies = "${lisp_local-time} ${lisp_legit}";
      name = "lisp_git-file-history-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
