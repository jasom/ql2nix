
{ buildLispPackage, stdenv, fetchurl, lisp-project_git-file-history, 
   lisp_fiveam, lisp_git-file-history,  
  sbcl, clisp, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_fiveam lisp_git-file-history  ];
      inherit stdenv;
      systemName = "git-file-history-test";
      
      sourceProject = "${lisp-project_git-file-history}";
      patches = [];
      lisp_dependencies = "${lisp_fiveam} ${lisp_git-file-history}";
      name = "lisp_git-file-history-test-20160825-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.clisp}" "${pkgs.ccl}" ];
    }
